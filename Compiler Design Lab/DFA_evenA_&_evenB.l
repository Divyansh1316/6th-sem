%{
#include<stdio.h>
%}

%s A B C INV

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>[^a|^b|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Accepted\n");};

<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>[^a|^b|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Rejected\n");};

<B>b BEGIN INITIAL;
<B>a BEGIN C;
<B>[^a|^b|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("Rejected\n");};

<C>b BEGIN A;
<C>a BEGIN B;
<C>[^a|^b|^\n] BEGIN INV;
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

//design a dfa using lex code that accepts all the strings having even number of a and even number of b
//design a dfa using lex code that accepts all the strings having even number of a followed by even number of b
//design a dfa using lex code that accepts all the strings having even number of a or even number of b
