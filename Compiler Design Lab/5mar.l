%{
#include<stdio.h>
%}
%%
["//"]+[a-zA-Z0-9]* {printf("Single line comment");}
["/*"]+["\n"]*[a-zA-Z0-9]*["\n"]*["*/"]+ {printf("Multi line comment");}
.* {printf("Normal sentence");}
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
//odd even

//write a lex code that takes a C program as input (filename: in.c), removes the comments(single line & multiline) and copy the modified code to another file (named as out.c)
