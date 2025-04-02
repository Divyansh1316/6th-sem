%{
#include<stdio.h>
%}

%s A B C INV

%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN C;
<INITIAL>[^0|^1|^\n] BEGIN INV;

<A>1 BEGIN B;
<A>0 BEGIN C;
<A>[^0|^1|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Rejected\n");};

<B>1 BEGIN B;
<B>0 BEGIN B;
<B>[^0|^1|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("Accepted\n");};

<C>1 BEGIN C;
<C>0 BEGIN C;
<C>[^0|^1|^\n] BEGIN INV;
<C>\n {BEGIN INITIAL; printf("Rejected\n");};

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

//starting with 11
