import java_cup.runtime.*;

%%

%class Lexer
%unicode
%cup
%line
%column


%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
	
  }
%}

nl = \r|\n|\r\n
ws = [ \t]
id = [A-Za-z_][A-Za-z0-9_]*
integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

%%
"("     {return symbol(sym.TO);}
")"     {return symbol(sym.TC);}
"{"     {return symbol(sym.GO);}
"}"     {return symbol(sym.GC);}
"="     {return symbol(sym.UG);}
"+"     {return symbol(sym.PIU);}
"-"     {return symbol(sym.MEN);}
"*"     {return symbol(sym.PER);}
"/"     {return symbol(sym.DIV);}
"<"     {return symbol(sym.MIN);}
">"     {return symbol(sym.MAG);}
"<="    {return symbol(sym.MIN_UG);}
"=<"    {return symbol(sym.UG_MIN);}
">="    {return symbol(sym.MAG_UG);}
"=>"    {return symbol(sym.UG_MAG);}
"&"     {return symbol(sym.AND);}
"|"     {return symbol(sym.OR);}
"!"     {return symbol(sym.NOT);}

"["     {return symbol(sym.QO);}
"]"     {return symbol(sym.QC);}

"int"   {return symbol(sym.INT_TYPE);}
"double" {return symbol(sym.DOUBLE_TYPE);}

print   {return symbol(sym.PRINT);}
if      {return symbol(sym.IF);}
while   {return symbol(sym.WHILE);}
else    {return symbol(sym.ELSE);}
then    {return symbol(sym.THEN);}
;       {return symbol(sym.PV);}
,       {return symbol(sym.VIR);}

{id}      {return symbol(sym.ID, yytext());}
{integer} {return symbol(sym.INT, new Integer(yytext()));}
{double}  {return symbol(sym.DOUBLE, new Double(yytext()));}

"/*" ~ "*/"     {;}

{ws}|{nl}       {;}

. {System.out.println("SCANNER ERROR: "+yytext());}
