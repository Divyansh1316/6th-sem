%{
	#include<stdio.h>
%}
%%
^aa[a-z0-1]* {printf("\nGraphic Era\n");}
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
