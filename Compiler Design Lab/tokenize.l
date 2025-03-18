%{
#include<stdio.h>

void print_token(char *type,char *value)
{
	printf("%s : %s\n",type,value);
}
%}
%%
"+"|"-"|"*"|"/"|"="|"=="|"!"|"!="|"<"|">"|"<="|">="|"%" { print_token("Operator",yytext); }
","|";"|"{"|"}"|"["|"]"|"("|")" { print_token("Separator",yytext); }
"if"|"while"|"for"|"int"|"float"|"char"|"double"|"continue"|"switch"|"do"|"break"|"else" { print_token("Keyword",yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { print_token("Identifier",yytext); }
[0-9]* { print_token("Constant",yytext); }
[ \t\n] {/*Ignore*/}
. { print_token("Unknown",yytext); }
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a C fragment : ");
	yylex();
	return 0;
}
