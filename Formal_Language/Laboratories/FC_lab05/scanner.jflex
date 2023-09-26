import java.io.*;
import java_cup.runtime.*;

%%

%unicode
%cup
%line
%column

    
nl = \n|\r|\n\r

%%

scalarReal = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
scalarVariable = [a-z]
vectorVariable = [A-Z]


{scalarReal}            { return new Symbol(sym.SCALARVARIABLE,yyline,yycolumn, new Double(yytext());)}
{scalarVariable}        { return new Symbol(sym.SCALARVARIABLE, yyline, yycolumn, new Character(yycharat(0))); }
{vectorVariable}        { return new Symbol(sym.VECTORVARIABLE, yyline, yycolumn, new Character(yycharat(0))); }


","               { return new Symbol(sym.CM, yyline, yycolumn); }
";"               { return new Symbol(sym.S, yyline, yycolumn); }
":"               { return new Symbol(sym.C, yyline, yycolumn); }
"%"               { return new Symbol(sym.SEP, yyline, yycolumn); }
"["               { return new Symbol(sym.OSB, yyline, yycolumn);}
"["               { return new Symbol(sym.CSB, yyline, yycolumn);}
"+"               { return new Symbol(sym.PLS, yyline, yycolumn);}
"-"               { return new Symbol(sym.MIN, yyline, yycolumn);}
"*"               { return new Symbol(sym.STR, yyline, yycolumn);}
"/"               { return new Symbol(sym.DIV, yyline, yycolumn);}
"="               { return new Symbol(sym.EQU, yyline, yycolumn);}
"?"               { return new Symbol(sym.QMK, yyline, yycolumn);}
"^"               { return new Symbol(sym.EXP, yyline, yycolumn);}
"."               { return new Symbol(sym.DOT, yyline, yycolumn);}


"/*" ~ "*/"       { ; }

{nl}|" "|\t       { ; } 
