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
hex =[0-9a-fA-F]
real = [+-]? ( [1-9][0-9]*\.[0-9]* | \.[0-9]+  |  0\.[0-9]* )
discount = ( [1-9][0-9]*\.[0-9]{2} | \.[0-9]{2}  |  0\.[0-9]{2} )
qstring =  \" ~ \"
sep = "##"




// date        =   ((0[1-9])|([1-2][0-9])|(3(0|1)))"/"((0[1-9])|(1(0|1|2)))"/"(2[0-9][0-9][0-9])
// hour        =   (((0|1)[0-9])|(2[0-3]))":"([0-5][0-9])
// timeAmPm    =   ((0[0-9])|(1[0-2]))":"([0-5][0-9]) ("am"|"pm")?
// ip_num      =   (2(([0-4][0-9])|(5[0-5])))|(1[0-9][0-9])|([1-9][0-9])|([0-9])
// ip          =   {ip_num}"."{ip_num}"."{ip_num}"."{ip_num}
// doubleExpNotation = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
// email =	([a-zA-Z0-9_\.])+"@"([a-zA-Z])+("."([a-zA-Z]))+
// file =	[a-zA-Z][a-zA-Z0-9]*"."[a-zA-Z]{3}


nl 		= \r | \n | \r\n
comment     =  "/-" ~ "-/"

token1 = {hexnum}\_{word}\_("SOS"|{endword})?
hexnum = (-((2[0-7]) | (1{hex}) | {hex}))|
		 ({hex}{1,3}) | (1{hex}{3}) | (2[0-4]{hex}{2}) | (25[0-5]{hex}) | (256[0-9a-cA-C]) 
word = [a-zA-Z]{5}([a-zA-Z]{2})*
endword = XY(YY)*ZZ(ZZ)*X

token2 = {sec} | {std} | {pm}

sec = (09\:21\:1[2-9]) | (09\:21\:[2-5][0-9]) | (09\:2[2-9]\:[0-5][0-9]) | (09\:[3-5][0-9]\:[0-5][0-9]) | 
	  (1[0-6]\:[0-5][0-9]\:[0-5][0-9])|
	  (17\:[0-3][0-9]\:[0-5][0-9]) | (17\:4[0-2]\:[0-5][0-9]) | (17\:43\:[0-2][0-9]) | (17\:43\:3[0-4])

std = (09\:21) | (09\:2[2-9]) | (09\:[3-5][0-9]) | 
	  (1[0-6]\:[0-5][0-9])|
	  (17\:[0-3][0-9]) | (17\:4[0-2]) | (17\:43)

pm = (09\:21am) | (09\:2[2-9]am) | (09\:[3-5][0-9]am) | 
	  (1[01]\:[0-5][0-9]am)|
	  (12\:[0-5][0-9]pm)|
	  (0[0-4]\:[0-5][0-9]pm)|
	  (05\:[0-3][0-9]pm) | (05\:4[0-2]pm) | (05\:43pm)


token3 = "$$"{bin} | "&&"{xo}

bin = 0*(10*){3} | 0*(10*){5}

xo = X((OX)*)(O)? | O((XO)*)(X)?

%%

//HERE ALL THE HARDCODED WORDS

{token1}			{if(test)System.out.print(yytext());return sym(sym.TOK1, new String(yytext()));}
{token2}			{if(test)System.out.print(yytext());return sym(sym.TOK2, new String(yytext()));}
{token3}			{if(test)System.out.print(yytext());return sym(sym.TOK3, new String(yytext()));}


"->" 			{if(test)System.out.print(yytext());return sym(sym.ARR);} 
"km" 			{if(test)System.out.print(yytext());return sym(sym.KMW);} 
"COMPUTE" 			{if(test)System.out.print(yytext());return sym(sym.CW);} 
"TO" 			{if(test)System.out.print(yytext());return sym(sym.TOW);} 
"TIME" 			{if(test)System.out.print(yytext());return sym(sym.TW);} 
"EXPENSE" 			{if(test)System.out.print(yytext());return sym(sym.EXPW);} 
"EXTRA" 			{if(test)System.out.print(yytext());return sym(sym.EW);} 
"km/h" 			{if(test)System.out.print(yytext());return sym(sym.KMH);} 
"euro/km" 			{if(test)System.out.print(yytext());return sym(sym.EKM);} 
"DISC" 			{if(test)System.out.print(yytext());return sym(sym.DW);} 
"euro" 			{if(test)System.out.print(yytext());return sym(sym.EURO);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 
//"WORD" 			{if(test)System.out.print(yytext());return sym(sym.W);} 


{discount}			{if(test)System.out.print(yytext()); return sym(sym.DISCOUNT,  Double.parseDouble(yytext()));}
{qstring}			{if(test)System.out.print(yytext());return sym(sym.QSTRING, new String(yytext()));}
//{id}				{if(test)System.out.print(yytext());return sym(sym.VARIABLE, new String(yytext()));}
{uint}			{if(test)System.out.print(yytext());return sym(sym.UINT, Integer.parseInt(yytext()));}
{real}			{if(test)System.out.print(yytext()); return sym(sym.REAL,  Double.parseDouble(yytext()));}
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
"%" 				{if(test)System.out.print(yytext());return sym(sym.PC);}
//"(" 				{if(test)System.out.print(yytext());return sym(sym.RO);}
//")" 				{if(test)System.out.print(yytext());return sym(sym.RC);}
// "[" 				{if(test)System.out.print(yytext());return sym(sym.SO);}
// "]" 				{if(test)System.out.print(yytext());return sym(sym.SC);}
//"{" 				{if(test)System.out.print(yytext());return sym(sym.BO);}
//"}" 				{if(test)System.out.print(yytext());return sym(sym.BC);}
//"=" 				{if(test)System.out.print(yytext());return sym(sym.EQ);}
// "==" 			{if(test)System.out.print(yytext());return sym(sym.EQEQ);}
// "!=" 			{if(test)System.out.print(yytext());return sym(sym.NEQ);}
// "&&" 			{if(test)System.out.print(yytext());return sym(sym.AND);}
// "||" 			{if(test)System.out.print(yytext());return sym(sym.OR);}
// "!" 				{if(test)System.out.print(yytext());return sym(sym.NOT);}
// "|" 				{if(test)System.out.print(yytext());return sym(sym.PIPE);}
//"+"               {if(test)System.out.print(yytext());return sym(sym.PLUS); }
"-"             	{if(test)System.out.print(yytext());return sym(sym.MINUS); }
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