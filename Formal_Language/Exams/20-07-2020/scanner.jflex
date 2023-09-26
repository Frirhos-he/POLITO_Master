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
id = [a-zA-Z_][a-zA-Z0-9_]*
//hexnum =[0-9a-fA-F]
// real = [+-]? ( [1-9][0-9]*\.[0-9]* | \.[0-9]+  |  0\.[0-9]* )
//qstring =  \" ~ \"

sep="$$"


nl 		= \r | \n | \r\n
comment     = "(++" ~ "++)"

token1 = [abc]{7}([abc]{2})*\#({hex})?

hex = ([1-9][1-9A-Fa-f][02468aAcCeE]) | ((a|A)[1-9aA][02468aAcCeE]) | ((a|A)(b|B)[0246]) | ([1-9A-Fa-f][02468aAcCeE]) | ([02468aAcCeE]) | 
	  (\-(([1-4][02468aAcCeE]) | (5[02468aAcC]) | ([02468aAcCeE])))

token2 = {hour}\:{bin}

hour = (07\:13\:2[4-9]) | (07\:1[4-9]\:[0-5][0-9]) | (07\:[2-5][0-9]\:[0-5][0-9]) | (0[8-9]\:[0-5][0-9]\:[0-5][0-9]) | (1[0-6]\:[0-5][0-9]\:[0-5][0-9]) |
	   (17\:[0-2][0-9]\:[0-5][0-9]) | (17\:3[0-6]\:[0-5][0-9]) | (17\:37\:[0-3][0-9]) | (17\:37\:4[0-3])

bin = (101) | (11[0-1]) | (1[01]{3}) | (10[01]{3}) | (1100[01]) | (11010) 

%%

//HERE ALL THE HARDCODED WORDS

{token1}			{if(test)System.out.print(yytext());return sym(sym.TOK1, new String(yytext()));}
{token2}			{if(test)System.out.print(yytext());return sym(sym.TOK2, new String(yytext()));}


compare				{if(test)System.out.print(yytext());return sym(sym.COMP_W);}
with				{if(test)System.out.print(yytext());return sym(sym.WW);}
end				{if(test)System.out.print(yytext());return sym(sym.ENDW);}
print				{if(test)System.out.print(yytext());return sym(sym.PW);}
//{qstring}			{if(test)System.out.print(yytext());return sym(sym.QSTRING, new String(yytext()));}
{id}				{if(test)System.out.print(yytext());return sym(sym.VARIABLE, new String(yytext()));}
{uint}			{if(test)System.out.print(yytext());return sym(sym.UINT, Integer.parseInt(yytext()));}
// {real}			{if(test)System.out.print(yytext()); return sym(sym.REAL,  Double.parseDouble(yytext()));}

// "." 				{if(test)System.out.print(yytext());return sym(sym.DOT);} 
//"," 				{if(test)System.out.print(yytext());return sym(sym.CM);}
";" 				{if(test)System.out.print(yytext());return sym(sym.S);}
//":" 				{if(test)System.out.print(yytext());return sym(sym.COL);}
"(" 				{if(test)System.out.print(yytext());return sym(sym.RO);}
")" 				{if(test)System.out.print(yytext());return sym(sym.RC);}
// "[" 				{if(test)System.out.print(yytext());return sym(sym.SO);}
// "]" 				{if(test)System.out.print(yytext());return sym(sym.SC);}
"{" 				{if(test)System.out.print(yytext());return sym(sym.BO);}
"}" 				{if(test)System.out.print(yytext());return sym(sym.BC);}
"=" 				{if(test)System.out.print(yytext());return sym(sym.EQ);}
// "==" 			{if(test)System.out.print(yytext());return sym(sym.EQEQ);}
// "!=" 			{if(test)System.out.print(yytext());return sym(sym.NEQ);}
// "&&" 			{if(test)System.out.print(yytext());return sym(sym.AND);}
// "||" 			{if(test)System.out.print(yytext());return sym(sym.OR);}
// "!" 				{if(test)System.out.print(yytext());return sym(sym.NOT);}
// "|" 				{if(test)System.out.print(yytext());return sym(sym.PIPE);}
"+"              {if(test)System.out.print(yytext());return sym(sym.PLUS); }
"-"             	{if(test)System.out.print(yytext());return sym(sym.MINUS); }
"*"              {if(test)System.out.print(yytext());return sym(sym.STAR); }
"/"              {if(test)System.out.print(yytext());return sym(sym.DIV); }
// "^"              {if(test)System.out.print(yytext());return sym(sym.PWR); }
// "<"              {if(test)System.out.print(yytext());return sym(sym.MIN); }
// ">"              {if(test)System.out.print(yytext());return sym(sym.MAJ); }
// "`"				{if(test)System.out.print(yytext());return sym(sym.BACKTICK); }
//"~"				{if(test)System.out.print(yytext());return sym(sym.TILDE); 

{sep}			{if(test)System.out.print(yytext());return sym(sym.SEP);}

{comment}	 		    {if(test)System.out.print(yytext());}
{nl} | " " | \t	{if(test)System.out.print(yytext());}
 
.				{ System.out.println("Scanner Error: " + yytext()); }