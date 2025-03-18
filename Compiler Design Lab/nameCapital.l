%{
	#include<stdio.h>
%}
%%
^[A-Z][a-z]*[" "][A-Z][a-z]* {printf("\n%s is accepted\n",yytext);}
.* {printf("\nRejected\n");}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a 1st name and last name : ");
	yylex();
	return 0;
}

//ip 1st name & last name, 1st name's first char capital and last name 1st char capital; then valid and number then invalid, 
