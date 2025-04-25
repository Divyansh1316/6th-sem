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

//a^nb^2n where n>=1

