%%

%standalone
%class exe3


nl				=  \n|\r|\r\n
numericConstant	=  [1-9][0-9]*
letter			=  [a-zA-Z]
keyword         =  (int | float | char | if | return | else | switch )
comments        =  \/\*{letter}+\*\/
directive		=  #{letter}+(" ")+\<{letter}+\.h\>
%init{
		  System.out.println("<HTML>");
		  System.out.println("<BODY bgcolor=#FFFFFF>");
		  System.out.println("<H2>main.c</H2>");
		  System.out.println("<CODE>");
%init}

%%

{directive}    {
	          System.out.print("<FONT COLOR=#00FF00>");
	          System.out.print(yytext());
	          System.out.println("</FONT>");
			}
{keyword}   	{
	          System.out.print("<FONT COLOR=#0000FF>");
	          System.out.print(yytext());
	          System.out.println("</FONT>");
				}
{numericConstant}	{
	          System.out.print("<FONT COLOR=#FF0000>");
	          System.out.print(yytext());
	          System.out.println("</FONT>");
			}
{comments} 	  	{
		  	  System.out.print("<FONT COLOR=#C0C0C0>");
	          System.out.print(yytext());
	          System.out.println("</FONT>");
				}							
{nl}|\t 	{System.out.println();}

.		{System.out.print(yytext());}