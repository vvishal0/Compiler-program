%{
#include<stdio.h>
#include "y.tab.h"



%}

digit           [0-9]+
number          [0-9]+\ .?|[0-9]*\.[0-9]+


%%


{digit} 	{
				yylval.p=atoi(yytext);
				return NUM;
			}
{number}	{
				yylval.p=atof(yytext); 
				return NUM;
			}

[\t];			
[\n]        {return 0;} 	    
.           {return yytext[0];}

%%
int yywrap()
{

	return 1;

}