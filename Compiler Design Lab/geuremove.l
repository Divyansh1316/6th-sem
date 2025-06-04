%{
#include<stdio.h>
#include<stdlib.h>
FILE *outfile;
%}
%%
^"geu" {fprintf(outfile,"upes");}
[\n] {fprintf(outfile,"%s",yytext);}
. {fprintf(outfile,"%s",yytext);}
%%
int yywrap()
{
	return 1;
}
int main()
{
	FILE *infile=fopen("input2.txt","r");
	if(!infile)
	{
		perror("Error opening input2.txt");
		return EXIT_FAILURE;
	}
	
	outfile=fopen("out2.txt","w");
	if(!outfile)
	{
		perror("Error opening out2.txt");
		fclose(infile);
		return EXIT_FAILURE;
	}
	
	yyin=infile;
	yylex();
	
	fclose(infile);
	fclose(outfile);
	return EXIT_SUCCESS;
}

//replace starting word of line if geu with upes
