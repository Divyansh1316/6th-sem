%{
#include<stdio.h>
%}

%s INV

%%
<INITIAL>0 {BEGIN INITIAL; printf("1");};
<INITIAL>1 {BEGIN INITIAL; printf("0");};
<INITIAL>[^0|^1|^\n] BEGIN INV;

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("Invalid");};
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
}

//design a melee machine that gives 1's complement of a binary number

