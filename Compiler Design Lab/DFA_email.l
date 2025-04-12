%{
#include<stdio.h>
%}

%s A B C D INV

%%
<INITIAL>[a-zA-Z0-9] BEGIN A;  
<INITIAL>\n {BEGIN INITIAL; printf("Rejected\n");};

<A>[a-zA-Z0-9] BEGIN A;  
<A>@ BEGIN B;
<A>\n {BEGIN INITIAL; printf("Rejected\n");};

<B>[a-zA-Z0-9] BEGIN B; 
<B>\. BEGIN C;
<B>\n {BEGIN INITIAL; printf("Rejected\n");};

<C>[a-zA-Z0-9] BEGIN D; 
<C>\n {BEGIN INITIAL; printf("Rejected\n");};

<D>[a-zA-Z0-9] BEGIN D; 
<D>\. BEGIN C;
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

//Design a DFA in lex for email validation.
