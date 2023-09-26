import java_cup.runtime.*;
 
%%
 
%unicode
%cup
%line
%column
 
%{
	private Symbol sym(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
 
	private Symbol sym(int type, Object value) {
		return new Symbol(type, yyline, yycolumn, value);
	}

	//true if debug printing
	private boolean test = false;
 
%}

/*HERE YOU MUST PUT THE REGULAR EXPRESSIONS OF THE LEXICON*/
/*round brackets (): used to group some elements (between OR or with a sequence of letters that is repeated)*/
/*square brackets []: used for intervals, separated by the dash -*/
/*braces {}: used to indicate the number of repetitions of that character or group of characters. if there is a range, the parentheses will have the minimum and the maximum value of repetitions, separated by a comma {min, max}*/
/*some characters are escape characters, and they must be put inside "" or they must follow \ (ex: +, *, $, ?)*/

uint	= 0 | [1-9][0-9]*
//sint = [+-]? [1-9][0-9]* | 0
//id = [a-zA-Z_][a-zA-Z0-9_]*
//hex =[0-9a-fA-F]
//real = [+-]? ( [1-9][0-9]*\.[0-9]* | \.[0-9]+  |  0\.[0-9]* )
price = ( [1-9][0-9]*\.[0-9]{2} | \.[0-9]{2}  |  0\.[0-9]{2} )
qstring =  \" ~ \"
sep = "####"




// date        =   ((0[1-9])|([1-2][0-9])|(3(0|1)))"/"((0[1-9])|(1(0|1|2)))"/"(2[0-9][0-9][0-9])
// hour        =   (((0|1)[0-9])|(2[0-3]))":"([0-5][0-9])
// timeAmPm    =   ((0[0-9])|(1[0-2]))":"([0-5][0-9]) ("am"|"pm")?
// ip_num      =   (2(([0-4][0-9])|(5[0-5])))|(1[0-9][0-9])|([1-9][0-9])|([0-9])
// ip          =   {ip_num}"."{ip_num}"."{ip_num}"."{ip_num}
// doubleExpNotation = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
// email =	([a-zA-Z0-9_\.])+"@"([a-zA-Z])+("."([a-zA-Z]))+
// file =	[a-zA-Z][a-zA-Z0-9]*"."[a-zA-Z]{3}


nl 		= \r | \n | \r\n
comment     = "(*" ~ "*)"

token1 = X-{hour}({word})?

hour = (03\:51\:4[7-9]) | (03\:51\:5[0-9]) | (03\:5[2-9]\:[0-5][0-9]) |
	   (0[4-9]\:[0-5][0-9]\:[0-5][0-9]) |
	   (1[0-9]\:[0-5][0-9]\:[0-5][0-9]) |
	   (2[0-2]\:[0-5][0-9]\:[0-5][0-9]) |
	   (23\:[0-3][0-9]\:[0-5][0-9]) | (23\:4[0-4]\:[0-5][0-9]) | (23\:45\:[0-2][0-9]) | (23\:45\:3[0-4])

word = ([ab]{2}){5}(([ab]{2}){2})*

token2 = Y-{bin}(((\-{bin}){3}) | ((\-{bin}){122}) | ((\-{bin}){256}))

bin = (101) | (11[01]) | (1[01]{3,5}) |
	  (100[01]{4}) | (101000[01])

%%

//HERE ALL THE HARDCODED WORDS

{token1}			{if(test)System.out.print(yytext());return sym(sym.TOK1, new String(yytext()));}
{token2}			{if(test)System.out.print(yytext());return sym(sym.TOK2, new String(yytext()));}


"euro/kg" 			{if(test)System.out.print(yytext());return sym(sym.EKG);} 
"euro" 			{if(test)System.out.print(yytext());return sym(sym.EW);} 
"kg" 			{if(test)System.out.print(yytext());return sym(sym.KGW);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 




{qstring}			{if(test)System.out.print(yytext());return sym(sym.QSTRING, new String(yytext()));}
//{id}				{if(test)System.out.print(yytext());return sym(sym.VARIABLE, new String(yytext()));}
{uint}			{if(test)System.out.print(yytext());return sym(sym.UINT, Integer.parseInt(yytext()));}
{price}			{if(test)System.out.print(yytext()); return sym(sym.PRICE,  Double.parseDouble(yytext()));}
//{real}			{if(test)System.out.print(yytext()); return sym(sym.REAL,  Double.parseDouble(yytext()));}
{sep}				{if(test)System.out.print(yytext()); return sym(sym.SEP);}

//{date}			{if(test)System.out.print(yytext());return sym(sym.DATE);}
//{hour}			{if(test)System.out.print(yytext());return sym(sym.HOUR);}
//{timeAmPm}		{if(test)System.out.print(yytext());return sym(sym.AMPM);}
//{ip}				{if(test)System.out.print(yytext()); return sym(sym.IP, new String(yytext()));}
//{doubleExpNotation}	{if(test)System.out.print(yytext()); return sym(sym.EXP);}
//{email}			{if(test)System.out.print(yytext());return sym(sym.EMAIL, new String(yytext()));}
// {file}			{if(test)System.out.print(yytext());return sym(sym.FILE, new String(yytext()));}

// "." 				{if(test)System.out.print(yytext());return sym(sym.DOT);} 
"," 				{if(test)System.out.print(yytext());return sym(sym.CM);}
";" 				{if(test)System.out.print(yytext());return sym(sym.S);}
":" 				{if(test)System.out.print(yytext());return sym(sym.COL);}
// "%" 				{if(test)System.out.print(yytext());return sym(sym.PC);}
//"(" 				{if(test)System.out.print(yytext());return sym(sym.RO);}
//")" 				{if(test)System.out.print(yytext());return sym(sym.RC);}
// "[" 				{if(test)System.out.print(yytext());return sym(sym.SO);}
// "]" 				{if(test)System.out.print(yytext());return sym(sym.SC);}
"{" 				{if(test)System.out.print(yytext());return sym(sym.BO);}
"}" 				{if(test)System.out.print(yytext());return sym(sym.BC);}
//"=" 				{if(test)System.out.print(yytext());return sym(sym.EQ);}
// "==" 			{if(test)System.out.print(yytext());return sym(sym.EQEQ);}
// "!=" 			{if(test)System.out.print(yytext());return sym(sym.NEQ);}
// "&&" 			{if(test)System.out.print(yytext());return sym(sym.AND);}
// "||" 			{if(test)System.out.print(yytext());return sym(sym.OR);}
// "!" 				{if(test)System.out.print(yytext());return sym(sym.NOT);}
// "|" 				{if(test)System.out.print(yytext());return sym(sym.PIPE);}
//"+"               {if(test)System.out.print(yytext());return sym(sym.PLUS); }
//"-"             	{if(test)System.out.print(yytext());return sym(sym.MINUS); }
//"*"               {if(test)System.out.print(yytext());return sym(sym.STAR); }
//"/"               {if(test)System.out.print(yytext());return sym(sym.DIV); }
// "^"              {if(test)System.out.print(yytext());return sym(sym.PWR); }
// "<"              {if(test)System.out.print(yytext());return sym(sym.MIN); }
// ">"              {if(test)System.out.print(yytext());return sym(sym.MAJ); }
// "`"				{if(test)System.out.print(yytext());return sym(sym.BACKTICK); }
//"~"				{if(test)System.out.print(yytext());return sym(sym.TILDE) }; 

{comment}	 		{if(test)System.out.print(yytext());}
{nl} | " " | \t		{if(test)System.out.print(yytext());}
 
.				{ System.out.println("Scanner Error: " + yytext()); }