%{
#include <stdio.h>
int neg,pos,fneg,fpos;
%}

%%
[\-][0-9]+ {neg++;}
[0-9]+ {pos++;}
[\-][0-9]*\.[0-9]+ {fneg++;}
[0-9]*\.[0-9]+ {fpos++;}
%%

int yywrap() { return 1; }

int main(){
	printf("Enter the number:");
	yylex();
	printf("%d %d %d %d",pos,neg,fpos,fneg);
	return 0;
}
