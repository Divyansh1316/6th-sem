%{
#include<stdio.h>
#include<stdlib.h>
FILE *outfile;
%}
%%
"<"[^>]+">" {fprintf(outfile,"%s",yytext);}
.|\n ;
%%
int yywrap()
{
	return 1;
}
int main()
{
	FILE *infile=fopen("inhtml.html","r");
	if(!infile)
	{
		perror("Error opening inhtml.html");
		return EXIT_FAILURE;
	}
	
	outfile=fopen("outhtml.html","w");
	if(!outfile)
	{
		perror("Error opening outhtml.html");
		fclose(infile);
		return EXIT_FAILURE;
	}
	
	yyin=infile;
	yylex();
	
	fclose(infile);
	fclose(outfile);
	return EXIT_SUCCESS;
}
