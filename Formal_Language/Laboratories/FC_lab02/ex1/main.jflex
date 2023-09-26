%%
%standalone
%class ex1


comment = "/*" ~ "*/"
char    = [a-zA-Z_][a-zA-Z0-9_]*
symbols = \{| \}| \(| \)| \[| \]| \+| \-| \*| \/| \=| \;| \.| \,| \<| \>| \& |\| |\!
keyword = ( if| else| while| print)
integer = [1-9][0-9]*|0
double  = {integer}\.[0-9]*
discarding = ("#include"|" "| \t | \n )
%%
{discarding} {;}
{comment} {;}
{keyword} { 
        System.out.print( yytext().toUpperCase()+" "); 
    }
{integer} {
        System.out.print( "INT:" + yytext().toUpperCase()+" "); 
    }
{double} {
        System.out.print( "DOUBLE:" + yytext().toUpperCase()+" "); 
    } 
{char} {
        System.out.print( "ID:" + yytext().toUpperCase()+" "); 
} 
{symbols} {
    if(yytext() == "["){
        System.out.print("SO ");   
    }
    if(yytext() == "]"){
        System.out.print("SC ");   
    }
    if(yytext() == ";"){
        System.out.print("S ");   
    }
    if(yytext() == ","){
        System.out.print("C ");   
    }
     if(yytext() == "double"){
        System.out.print("DOUBLE_TYPE ");    
    }
     if(yytext() == "int"){
        System.out.print("INT_TYPE " );    
    }
    if(yytext() == "="){
        System.out.print("EQ ");
    }
    if(yytext() == "+"){
        System.out.print("PLUS ");
    }
    if(yytext() == "-"){
        System.out.print("MINUS ");
    }
    if(yytext() == ">"){
        System.out.print("MAJ ");
    }
    if(yytext() == "<"){
        System.out.print("MINUS ");
    }
    if(yytext() == "("){
        System.out.print("RO ");
    }
    if(yytext() == ")"){
        System.out.print("BO ");
    }

     if(yytext() == "if"){
        System.out.println("IF ");    
    }
     if(yytext() == "else"){
        System.out.println("ELSE " );    
    }
     if(yytext() == "while"){
        System.out.println("WHLE " );    
    }
     if(yytext() == "print"){
        System.out.println("PRINT ");    
    }
     if(yytext() == "print"){
        System.out.println("DOUBLE_TYPE ");    
    }
}