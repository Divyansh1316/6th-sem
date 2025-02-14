%{
#include<stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {printf("VALID");}
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
//identifier valid or not
