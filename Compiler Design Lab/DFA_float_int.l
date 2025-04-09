%{
#include<stdio.h>
%}

%s A B C INV

%%
<INITIAL>0|1|2|3|4|5|6|7|8|9 BEGIN A;
<INITIAL>[^0|^1|^2|^3|^4|^5|^6|^7|^8|^9] BEGIN INV;

<A>0|1|2|3|4|5|6|7|8|9 BEGIN A;
<A>\. BEGIN B;
<A>^0|^1|^2|^3|^4|^5|^6|^7|^8|^9 BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Integer\n");};

<B>0|1|2|3|4|5|6|7|8|9 BEGIN C;
<B>^0|^1|^2|^3|^4|^5|^6|^7|^8|^9 BEGIN INV;
<B>\. BEGIN INV;
<B>\n {BEGIN INITIAL; printf("Rejected\n");};

<C>0|1|2|3|4|5|6|7|8|9 BEGIN C;
<C>^0|^1|^2|^3|^4|^5|^6|^7|^8|^9 BEGIN INV;
<C>\n {BEGIN INITIAL; printf("Float\n");};

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

//Design a DFA in LEX Code to identify and print integer & float constants and identifier
