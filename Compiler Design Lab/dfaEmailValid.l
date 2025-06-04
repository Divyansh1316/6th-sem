%{
#include<stdio.h>
%}

%s A B C D E INV

%%
<INITIAL>[A-Za-z0-9] BEGIN A;
<INITIAL>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<INITIAL>. BEGIN INV;

<A>[A-Za-z0-9] BEGIN A;
<A>[@] BEGIN B;
<A>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<A>. BEGIN INV;

<B>[A-Za-z] BEGIN C;
<B>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<B>. BEGIN INV;

<C>[A-Za-z] BEGIN C;
<C>[.] BEGIN D;
<C>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<C>. BEGIN INV;

<D>[A-Za-z] BEGIN E;
<D>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<D>. BEGIN INV;

<E>[A-Za-z] BEGIN E;
<E>[.] BEGIN D;
<E>[\n] {BEGIN INITIAL;printf("Accepted\n");}
<E>. BEGIN INV;

<INV>[\n] {BEGIN INITIAL;printf("Invalid\n");}
<INV>. BEGIN INV;
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter input : ");
	yylex();
}
