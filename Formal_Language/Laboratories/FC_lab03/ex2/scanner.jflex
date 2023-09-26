import java_cup.runtime.*;

%%

%class scanner
%cup


nl                  = \r|\n|\r\n
ws                  = [ \t]
letter              = [A-Za-z]
name                = {letter}+
space               = " "
number              = [0-9]+
day                 = 0[0-9]|[12][0-9]|3[01]
month               = (0[1-9]|1[012])
year                = [0-9]{4}
hexadecimal         = [A-Za-z0-9]
apicname            = \"~\"
ISBN_code           = ({number})-({number})-({hexadecimal}{5}-{hexadecimal})
date                = {day}\/{month}\/{year}


%%
{ISBN_code}     {   System.out.println("ISBN:" + yytext());
                return new Symbol(sym.ISBN_code);}
{apicname}      {   System.out.println("apicname:" + yytext());
                return new Symbol(sym.APICSNAME);}
{number}        {System.out.println("number:" + yytext());
                   return new Symbol(sym.N);}
{letter} {      System.out.println("letter:" + yytext());
                return new Symbol(sym.LETTER);}                               
{date} {        System.out.println("date:" + yytext());
                return new Symbol(sym.DATE);
}

"-"     { System.out.println("-"); return new Symbol(sym.MINUS);}
">"     {System.out.println(">");  return new Symbol(sym.MAJ);}
"%"     {System.out.println("%");  return new Symbol(sym.PERC);}
","     {System.out.println(",");  return new Symbol(sym.COMM);}
":"     {System.out.println(":");  return new Symbol(sym.COL);}
";"     {System.out.println(";");  return new Symbol(sym.SEM);}
"LI"     {System.out.println("LI");  return new Symbol(sym.LI);}
"BO"     {System.out.println("LI");  return new Symbol(sym.BO);}
"LS"     {System.out.println("LI");  return new Symbol(sym.LS);}
"AV"     {System.out.println("LI");  return new Symbol(sym.AV);}
"SO"     {System.out.println("LI");  return new Symbol(sym.SO);}

{ws}|{nl}       {;}

. {System.out.println("SCANNER ERROR: "+yytext());}
