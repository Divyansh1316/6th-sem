%{
#include<stdio.h>
%}

%s A B C D R INV

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN R;
<INITIAL>[^a|^b|^\n] BEGIN INV;

<R>a BEGIN R;
<R>b BEGIN R;
<R>[^a|^b|^\n] BEGIN INV;
<R>\n {BEGIN INITIAL; printf("Rejected\n");};

<A>a BEGIN B;
<A>b BEGIN R;
<A>[^a|^b|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Rejected\n");};

<B>a BEGIN A;
<B>b BEGIN C;
<B>[^a|^b|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("Rejected\n");};

<C>b BEGIN D;
<C>a BEGIN R;
<C>[^a|^b|^\n] BEGIN INV;
<C>\n {BEGIN INITIAL; printf("Rejected\n");};

<D>b BEGIN C;
<D>a BEGIN R;
<D>[^a|^b|^\n] BEGIN INV;
<D>\n {BEGIN INITIAL; printf("Accepted\n");};

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

//design a dfa using lex code that accepts all the strings having even number of a followed by even number of b
