import java_cup.runtime.*;

%%

%unicode
%cup

Comment = \/\*~\*\/

Atom1 = [a-z][A-Za-z0-9_]*
Atom2 = [-\+]? {Num} {Exp}?
Variable = [A-Z_][A-Za-z0-9_]*


Num = {integer}|{double}
Exp = e|E [-\+]? {Num}

integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

SpaceTab = [\ \t]
nl = \n|\r|\r\n

%%

{Comment} {;}
\. {System.out.println("DOT");return new Symbol(sym.DOT);}
: {System.out.println("COLUMN");return new Symbol(sym.COL);}
\- {System.out.println("DASH");return new Symbol(sym.DASH);}
, {System.out.println("COMMA");return new Symbol(sym.C);}
\? {System.out.println("QUESTION MARK");return new Symbol(sym.QM);}
\( {System.out.println("ROUND OPEN");return new Symbol(sym.RO);}
\) {System.out.println("ROUND CLOSED");return new Symbol(sym.RC);}

{Atom1}|{Atom2} {System.out.println("Atom: " + yytext());return new Symbol(sym.ID);}
{Variable} {System.out.println("Variable: " + yytext());return new Symbol(sym.VAR);}

{nl}|{SpaceTab} {;}

. {System.out.println("Error:" + yytext());}
