%{
#include<stdio.h>
int sp=0,line=0,tab=0,c=0,word=0,chars=0;
%}
%%
[" "] {sp++; chars++;}
[\t] {tab++; chars++;}
[\n] {line++; chars++;}
[a-zA-Z]* {word++; chars+=yyleng;}
. {c++; chars++;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a string : ");
	yylex();
	printf("Spaces : %d, Tabs : %d, special characters : %d, words : %d, characters : %d, lines : %d",sp,tab,c,word,chars,line);
	return 0;
}
