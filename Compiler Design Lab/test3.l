%{
	#include<stdio.h>
%}
%%
^aa[0-9]*bb$ {printf("\nGraphic Era\n");}
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
