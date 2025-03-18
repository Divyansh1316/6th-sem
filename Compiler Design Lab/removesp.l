%{
#include<stdio.h>
#include<stdlib.h>
FILE *outfile;
%}
%%
[ \t\n]+ {fprintf(outfile," ");}
[^ \t\n]+ {fprintf(outfile,"%s",yytext);}
%%
int yywrap()
{
	return 1;
}
int main()
{
	FILE *infile=fopen("input.txt","r");
	if(!infile)
	{
		perror("Error opening input.txt");
		return EXIT_FAILURE;
	}
	
	outfile=fopen("out.txt","w");
	if(!outfile)
	{
		perror("Error opening out.txt");
		fclose(infile);
		return EXIT_FAILURE;
	}
	
	yyin=infile;
	yylex();
	
	fclose(infile);
	fclose(outfile);
	return EXIT_SUCCESS;
}

