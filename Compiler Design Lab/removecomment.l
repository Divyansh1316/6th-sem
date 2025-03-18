%{
#include<stdio.h>
#include<stdlib.h>
FILE *outfile;
%}
%%
"//".* {/*Ignore single line comments*/}
"/*"[^*/]*"*/" {/*Ignore multi line comments*/}
\n {fprintf(outfile,"%s",yytext);}
. {fprintf(outfile,"%s",yytext);}
%%
int yywrap()
{
	return 1;
}
int main()
{
	FILE *infile=fopen("ip.txt","r");
	if(!infile)
	{
		perror("Error opening ip.txt");
		return EXIT_FAILURE; 
	}
	
	outfile=fopen("op.txt","w");
	if(!outfile)
	{
		perror("Error opening op.txt");
		fclose(infile);
		return EXIT_FAILURE;
	}
	
	yyin=infile;
	yylex();
	
	fclose(infile);
	fclose(outfile);
	return EXIT_SUCCESS;
}



/*
Input file:
hello this is 
//divyansh
this is a new line

/*
new line

this is multiline comment
*/
delete it 

// this is a single-line comment
printf("Hello worlds!\n"); /*This is a multi line
comment */
return 0;

//hello divyansh
int x=123;
*/
