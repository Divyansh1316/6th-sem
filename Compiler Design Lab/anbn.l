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

//w=>wcwr where W belongs to any combination of ab
//a^nb^2n where n>=1
//a^(n+2)b^n where n>=1
//a^n b^p c^n where n>=1 and p>=0
