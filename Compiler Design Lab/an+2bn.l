%{
#include "y.tab.h"
%}

%%
[a] {return A;}
[b] {return B;}
[\n] {return NL;}
%%

int yywrap()
{
	return 1;
}

//a^(n+2)b^n where n>=1
