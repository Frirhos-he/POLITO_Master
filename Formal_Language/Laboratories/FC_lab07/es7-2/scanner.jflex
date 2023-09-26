import java_cup.runtime.*;

%%

%class Lexer
%unicode
%cup
%line
%column


%{
  private Symbol symbol(int type) {
    //System.out.println (type);
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    //System.out.println (type +"=>" + value);
    return new Symbol(type, yyline, yycolumn, value);
	
  }
%}

INTEGER 	= [1-9][0-9]*|0
ID 		= [A-Za-z_][0-9A-Za-z_]*
COMMENT 	= "/*"([^*]*|"*"+[^*/])"*"+\/
TIPI		= int | float | double | char

%%

^#.* { /* Elimina direttive preprocessore */ }
{COMMENT} { /* Elimina commenti */ }

{TIPI} {return symbol(sym.TYPE,parser.type_lookup(yytext()));}
{INTEGER} {return symbol(sym.NUM, new Integer(yytext()));}

{ID} { return symbol(sym.ID, new String(yytext()));}

"*" {return symbol(sym.TIMES);}
"[" {return symbol(sym.LBS);}
"]" {return symbol(sym.RBS);}
";" {return symbol(sym.PV);}
"," {return symbol(sym.CM);}
[ \t\n\r]+ {;}
