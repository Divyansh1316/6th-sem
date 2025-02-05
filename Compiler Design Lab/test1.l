%{
	#include<stdio.h>
%}
%%
"Hi" {printf("\nGraphic Era\n");}
.* {printf("\nGraphic\n");}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a string : ");
	yylex();
	return 0;
}

//to run the file:
//lex test1.l
//cc lex.yy.c
//./a.out
