%{
#include<stdio.h>
%}

%s IDENTIFIER INTEGER FLOAT INV

%%
<INITIAL>[A-Za-z_] BEGIN IDENTIFIER;
<INITIAL>[0-9] BEGIN INTEGER;
<INITIAL>[\n] BEGIN INITIAL;
<INITIAL>. BEGIN INV;

<IDENTIFIER>[A-Za-z0-9_] BEGIN IDENTIFIER;
<IDENTIFIER>[\n] {BEGIN INITIAL; printf("Identifier");}
<IDENTIFIER>. BEGIN INV;

<INTEGER>[0-9] BEGIN INTEGER;
<INTEGER>[.] BEGIN FLOAT;
<INTEGER>[\n] {BEGIN INITIAL; printf("Integer");}
<INTEGER>. BEGIN INV;

<FLOAT>[0-9] BEGIN FLOAT;
<FLOAT>[\n] {BEGIN INITIAL; printf("Float");}
<FLOAT>. BEGIN INV;

<INV>[\n] {BEGIN INITIAL;printf("Invalid");}
<INV>. BEGIN INV;
%%

int yywrap()
{	
	return 1;
}

int main()
{
	printf("Enter a string : ");
	yylex();
}
