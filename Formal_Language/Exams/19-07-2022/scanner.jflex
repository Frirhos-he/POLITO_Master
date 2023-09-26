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

//uint	= 0 | [1-9][0-9]*
//sint = [+-]? [1-9][0-9]* | 0
//id = [a-zA-Z_][a-zA-Z0-9_]*
//hexnum =[0-9a-fA-F]
real = [+-]? ( [1-9][0-9]*\.[0-9]* | \.[0-9]+  |  0\.[0-9]* )
//qstring =  \" ~ \"


nl 		= \r | \n | \r\n
sep = "%%%%"(("%%")*)
comment     = ("(((-" ~ "-)))")|("---".* )

token1 = A_({bin}|((\*)((\+)|(\+\*)*|(\+(\*\+)*)))|((\+)((\*)|(\*\+)*|(\*(\+\*)*))))
bin = (([01]*0){2}[01]*) | (([01]*0){5}[01]*) 
token2 = B_({word}([\*\+\$]{word}){3})(([\*\+\$]{word}){2})*
word = - ((3[0-2]) | ([12][0-9]) | ([1-9]) ) |
	   (([0-9]) | ([1-9][0-9]{1,2}) | (1[0-1][0-9]{2}) | (12[0-3][0-9]) | (124[0-6]) )

%%

//HERE ALL THE HARDCODED WORDS

{token1}			{if(test)System.out.print(yytext());return sym(sym.TOK1, new String(yytext()));}
{token2}			{if(test)System.out.print(yytext());return sym(sym.TOK2, new String(yytext()));}


"START"			{if(test)System.out.print(yytext());return sym(sym.SW);}
"BATTERY"			{if(test)System.out.print(yytext());return sym(sym.BW);}
"kWh"			{if(test)System.out.print(yytext());return sym(sym.KW);}
"FUEL"			{if(test)System.out.print(yytext());return sym(sym.FW);}
"liters"			{if(test)System.out.print(yytext());return sym(sym.LW);}
"MAX"			{if(test)System.out.print(yytext());return sym(sym.MAX);}
"MOD"			{if(test)System.out.print(yytext());return sym(sym.MW);}
"USE"			{if(test)System.out.print(yytext());return sym(sym.UW);}
"DO"			{if(test)System.out.print(yytext());return sym(sym.DW);}
"DONE"			{if(test)System.out.print(yytext());return sym(sym.DONE);}
"km"			{if(test)System.out.print(yytext());return sym(sym.KM);}
"units/km"			{if(test)System.out.print(yytext());return sym(sym.UKM);}

//{qstring}			{if(test)System.out.print(yytext());return sym(sym.QSTRING, new String(yytext()));}
//{id}				{if(test)System.out.print(yytext());return sym(sym.VARIABLE, new String(yytext()));}
//{uint}			{if(test)System.out.print(yytext());return sym(sym.UINT, Integer.parseInt(yytext()));}
{real}			{if(test)System.out.print(yytext()); return sym(sym.REAL,  Double.parseDouble(yytext()));}

// "." 				{if(test)System.out.print(yytext());return sym(sym.DOT);} 
"," 				{if(test)System.out.print(yytext());return sym(sym.CM);}
";" 				{if(test)System.out.print(yytext());return sym(sym.S);}
//":" 				{if(test)System.out.print(yytext());return sym(sym.COL);}
"(" 				{if(test)System.out.print(yytext());return sym(sym.RO);}
")" 				{if(test)System.out.print(yytext());return sym(sym.RC);}
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
"PLUS"              {if(test)System.out.print(yytext());return sym(sym.PLUS); }
"-"             	{if(test)System.out.print(yytext());return sym(sym.MINUS); }
"STAR"              {if(test)System.out.print(yytext());return sym(sym.STAR); }
//"/"              {if(test)System.out.print(yytext());return sym(sym.DIV); }
// "^"              {if(test)System.out.print(yytext());return sym(sym.PWR); }
// "<"              {if(test)System.out.print(yytext());return sym(sym.MIN); }
// ">"              {if(test)System.out.print(yytext());return sym(sym.MAJ); }
// "`"				{if(test)System.out.print(yytext());return sym(sym.BACKTICK); }
//"~"				{if(test)System.out.print(yytext());return sym(sym.TILDE); 

{sep}				{if(test)System.out.print(yytext());return sym(sym.SEP);} 
{comment}	 		    {if(test)System.out.print(yytext());}
{nl} | " " | \t	{if(test)System.out.print(yytext());}
 
.				{ System.out.println("Scanner Error: " + yytext()); }