%{
#include<stdio.h>
%}
%%
[0-9]* {printf("%s is a number",yytext);}
[0-9]*[.][0-9]+ {printf("%s is float",yytext);}
.* {printf("Invalid");}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a number : ");
	yylex();
	return 0;
}
