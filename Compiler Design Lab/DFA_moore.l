%{
#include<stdio.h>
%}

%s Q01 INV

%%
<INITIAL>0 {BEGIN Q01; printf("1");};
<INITIAL>1 {BEGIN INITIAL; printf("0");};
<INITIAL>[^0|^1|^\n] BEGIN INV;

<Q01>0 {BEGIN Q01; printf("1");};
<Q01>1 {BEGIN INITIAL; printf("0");};
<Q01>[^0|^1|^\n] BEGIN INV;

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

//design a moore machine that gives 1's complement of a binary number
