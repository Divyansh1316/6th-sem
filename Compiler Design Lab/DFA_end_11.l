%{
#include<stdio.h>
%}

%s A B  INV

%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN INITIAL;
<INITIAL>[^0|^1|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Rejected\n");};

<A>1 BEGIN B;
<A>0 BEGIN INITIAL;
<A>[^0|^1|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Rejected\n");};

<B>1 BEGIN B;
<B>0 BEGIN INITIAL;
<B>[^0|^1|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("Accepted\n");};

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("Invalid\n");};
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
}

//ending with 11
