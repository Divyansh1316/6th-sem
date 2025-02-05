%{
	#include<stdio.h>
%}
%%
^aa[a-b]*|bb[a-b]* {printf("\n%s is accepted\n",yytext);}
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
