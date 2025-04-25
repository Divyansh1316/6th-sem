%{
#include<stdio.h>
#include<stdlib.h>
%}

%token A B NL

%%
stmt: S NL {printf("Valid string\n"); exit(0);};
S: A A T
T: A T B
	| ;
%%

int yyerror()
{
	printf("Invalid string\n"); exit(0);
}

void main()
{
	printf("Enter a string: ");
	yyparse();
}
