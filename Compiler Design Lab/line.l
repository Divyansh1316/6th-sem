%{
#include<stdio.h>
int sp=0,line=0,tab=0,c=0,word=0;
%}
%%
[" "] {sp++;}
[\t] {tab++;}
[\n] {line++;}
[a-zA-Z]* {word++;}
. {c++;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter a string : ");
	yylex();
	printf("Spaces : %d, Tabs : %d, special characters : %d, words : %d, lines : %d",sp,tab,c,word,line);
	return 0;
}
