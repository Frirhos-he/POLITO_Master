%%
%standalone
%caseless
%class ex2


comment = "<!--" ~ "-->"
tag =\<(\/)?head~ \> |\<(\/)?body~ \> |\<(\/)?html~ \> |\<(\/)?title~ \>
h1  =\<(\/)?h1 ~ \>
h2  =\<(\/)?h2 ~ \>
h3  =\<(\/)?h3 ~ \>
h4  =\<(\/)?h4 ~ \>
table=\<(\/)?table ~\>
%{
    int tag=0;
    int table=0;
    int h1v=0;
    int h2v=0;
    int h3v=0;
    int h4v=0;
%}
%eof{
    System.out.println("Total number of tags:" + tag);
    System.out.println("Total number of table tags:" + table);
    System.out.println("Total number of h1 tags:" + h1v);
    System.out.println("Total number of h2 tags:" + h2v);
    System.out.println("Total number of h3 tags:" + h3v);
    System.out.println("Total number of h4 tags:" + h4v);

%eof}


%%


{comment} {;}
{h1} {
    System.out.print(yytext());
    h1v++;
    tag++;
}
{h2} {
    System.out.print(yytext());
    h2v++;
    tag++;
}

{h3} {
    System.out.print(yytext());
    h3v++;
    tag++;
}

{h4} {
    System.out.print(yytext());
    h4v++;
    tag++;
}
{table} {
    System.out.print(yytext() );
    tag++;
    table++;
}

{tag} {
    System.out.print(yytext() + "+++");
    tag++;
}


