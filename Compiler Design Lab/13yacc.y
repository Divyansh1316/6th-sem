%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
ArithmeticExpression:
 E {printf("Result : %d",$$); exit(0);};
E:
 E '+' E {$$=$1+$3;}
 |E '-' E {$$=$1-$3;}
 |E '*' E {$$=$1*$3;}
 |E '/' E {$$=$1/$3;}
 |E '%' E {$$=$1%$3;}
 |'(' E ')' {$$=$2;}
 | NUMBER {$$=$1;}
 ;
%%

int yyerror()
{
	printf("Invalid\n");
	exit(0);
}

int main(){
	printf("Enter arithmetic expression:");
	yyparse();
}
