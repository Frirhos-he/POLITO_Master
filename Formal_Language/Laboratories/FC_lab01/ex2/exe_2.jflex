
%%

%standalone
%class Exercise2

nl		        =  \n|\r|\r\n

letter          =  [a-zA-Z]
exadecimal      =  [A-F0-9]
alfadigit       =  [a-zA-Z0-9]
number          =  [0-9]
//protocol        =  ("http"|"https"|ftp):
protocol        =  {letter}+:\/\/
domainN         =  www\.{id}+\.{letter}{2}
case           =   ([0-9] | [0-9][0-9] | 1[0-9][0-9] | 2[0-5][0-5])
domainP        =  ({case}\.{case}\.{case}\.{case})
url             =  ({domainN} | {domainP})?(\/)?({PathName}\/)*{FileName}(\.{FileType})?
FileName        =  {id}
FileType        =  {id}
PathName        =  {id}
id              =  ({letter} | {number} )( {letter} | {number} )*
letter          =  [^0-9\\\/:\*\?\"\-\<\>\|\r\n\ \t]
port            =  ({url} ):{number}+
anchorFinal     =  {url}#{alfadigit}+
escapes         =  \%{exadecimal}{1,2}

%%

{nl}|" "|\t|\/ 	{;}
{escapes}	    {System.out.println("escapes: " + yytext());}
{protocol}	    {System.out.println("Protocol: " + yytext());}
{anchorFinal}	{System.out.println("anchorFinal: " + yytext());}
{url}	        {System.out.println("url: " + yytext());}
{port}	        {System.out.println("port: " + yytext());}


.		        {System.out.println("Error: " + yytext());}