
%%

%standalone
%class Exercise1

nl		        =  \n|\r|\r\n
letter          =  [^0-9\\\/:\*\?\"\-\<\>\|\r\n\ \t]   //EVERYTHING IN PARENTHESIS IS IGNORED
Drive           =  {letter}
digit           =  [0-9]
id              =  ({letter} | {digit} )( {letter} | {digit} )*
PathName        =  {id}
FileName        =  {id}
FileType        =  {id}
PathFileName    =  ({Drive}:)?(\\)?({PathName}\\)*{FileName}(\.{FileType})?


%%

{nl}|" "|\t 	{;}
{PathFileName}	{System.out.println("PathFileName: " + yytext());}
.		{System.out.println("Error: " + yytext());}