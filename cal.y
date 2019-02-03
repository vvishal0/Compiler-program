%{
	int yylex();
	void yyerror(char *str);
    #include<stdio.h>
    #include<stdlib.h>

   
%}

%union 
{
	double p;
}
%token<p> NUM
%left '+' '-'
%left '*' '/'
%left '^'
%nonassoc uminu
%left '(' ')'
%type<p>E

%%

Exp:E           {
					printf("\nResult=%g\n",$1);
					return 0;
				};

E:E'+'E 		{$$=$1+$3;printf("+");}
 |E'-'E 		{$$=$1-$3;printf("-");}
 |E'*'E 		{$$=$1*$3;printf("*");}
 |E'/'E 		{if($3==0)
				{	
					printf("Divide by Zero");
					exit(0);
				}	
				else
					$$=$1/$3;printf("/");}  
 |E'^'E         {
 					$$=$1;
 					for(int i=0;i<$3-1;i++)
 					{
 						$$=$$*$1;
 					}
 					printf("^");

 				}
 |'-'E          {$$=-$2; printf("-");}
 |				'('E')' {$$=$2;}
 | 				NUM {$$=$1;printf("%.1f",yylval.p);}
;

%%

void main()
{
	while(1)
	{
		printf("\nEnter Expression:(No space is allow!!)\n");
		yyparse();
	}	

}

void yyerror(char * str)
{
	printf("Error YACC %s\n",str);

}