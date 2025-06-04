%{
#include<stdio.h>
%}

%s A B C INV

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>\n {BEGIN INITIAL; printf("Accepted\n");};
<INITIAL>. BEGIN INV;

<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>\n {BEGIN INITIAL; printf("Accepted\n");};
<A>. BEGIN INV;

<B>b BEGIN INITIAL;
<B>a BEGIN C;
<B>\n {BEGIN INITIAL; printf("Accepted\n");};
<B>. BEGIN INV;

<C>b BEGIN A;
<C>a BEGIN B;
<C>\n {BEGIN INITIAL; printf("Rejected\n");};
<C>. BEGIN INV;

<INV>\n {BEGIN INITIAL; printf("Invalid\n");};
<INV>. BEGIN INV;
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
}

//design a dfa using lex code that accepts all the strings having even number of a or even number of b
