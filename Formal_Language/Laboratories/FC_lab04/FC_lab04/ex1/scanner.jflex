import java_cup.runtime.*;

%%

%class scanner
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

double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
id = [A-Za-z0-9_]*
integer =  ([\+\-]?[1-9][0-9]*|0)
atom = [a-z] {id} | {double} | {integer}
variable = [A-Z_] {id}
comment = \/\* ~ \*\/
nl = \r|\n|\r\n
ws = [ \t]


%%
"("     {System.out.println("(");return symbol(sym.FP);}
")"     {System.out.println(")");return symbol(sym.BP);}
\-     {System.out.println("-");return symbol(sym.MINUS);}
\.      {System.out.println(".");return symbol(sym.DOT);}
;               {System.out.println(";");return symbol(sym.SM);}
,               {System.out.println(",");return symbol(sym.COM);}
:               {System.out.println(":");return symbol(sym.CL);}
\?              {System.out.println("?");return symbol(sym.QMARK);}
{variable}      {System.out.println("variable");return symbol(sym.VARIABLE);}
{atom}          {System.out.println("atom");return symbol(sym.ATOM);}
{id}            {System.out.println("id" +yytext());return symbol(sym.ID);}
{comment}       {System.out.println("comment");}
{ws}|{nl}       {;}

. {System.out.println("SCANNER ERROR: "+yytext());}
