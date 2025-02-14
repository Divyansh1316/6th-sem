%{
#include<stdio.h>
%}
%%
[a-zA-Z0-9]+[@][a-zA-Z]+([.][a-zA-Z]+)+ {printf("VALID");}
.* {printf("INVALID");}
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
//gmail valid or not
