%{
#include<stdio.h>
%}

%s INITIAL_A INITIAL_B INITIAL_C INITIAL_AB INITIAL_BC INITIAL_ABC INITIAL_AC INV

%%
<INITIAL>a BEGIN INITIAL_A;
<INITIAL>b BEGIN INITIAL;
<INITIAL>[^a|^b|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Rejected\n");};

<INITIAL_A>a BEGIN INITIAL_AB;
<INITIAL_A>b BEGIN INITIAL_B;
<INITIAL_A>[^a|^b|^\n] BEGIN INV;
<INITIAL_A>\n {BEGIN INITIAL; printf("Rejected\n");};

<INITIAL_AB>a BEGIN INITIAL_ABC;
<INITIAL_AB>b BEGIN INITIAL_BC;
<INITIAL_AB>[^a|^b|^\n] BEGIN INV;
<INITIAL_AB>\n {BEGIN INITIAL; printf("Rejected\n");};

<INITIAL_BC>a BEGIN INITIAL_AC;
<INITIAL_BC>b BEGIN INITIAL_C;
<INITIAL_BC>[^a|^b|^\n] BEGIN INV;
<INITIAL_BC>\n {BEGIN INITIAL; printf("Accepted\n");};

<INITIAL_B>a BEGIN INITIAL_AC;
<INITIAL_B>b BEGIN INITIAL_C;
<INITIAL_B>[^a|^b|^\n] BEGIN INV;
<INITIAL_B>\n {BEGIN INITIAL; printf("Rejected\n");};

<INITIAL_C>a BEGIN INITIAL_A;
<INITIAL_C>b BEGIN INITIAL;
<INITIAL_C>[^a|^b|^\n] BEGIN INV;
<INITIAL_C>\n {BEGIN INITIAL; printf("Accepted\n");};

<INITIAL_ABC>a BEGIN INITIAL_ABC;
<INITIAL_ABC>b BEGIN INITIAL_BC;
<INITIAL_ABC>[^a|^b|^\n] BEGIN INV;
<INITIAL_ABC>\n {BEGIN INITIAL; printf("Accepted\n");};

<INITIAL_AC>a BEGIN INITIAL_AB;
<INITIAL_AC>b BEGIN INITIAL_B;
<INITIAL_AC>[^a|^b|^\n] BEGIN INV;
<INITIAL_AC>\n {BEGIN INITIAL; printf("Accepted\n");};

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

//design a dfa using lex code that accepts all the strings containing third last element 'a' over the input alphabet [a,b]
