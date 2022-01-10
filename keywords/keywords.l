%{
#include <stdio.h>
#include <ctype.h>
%}

keyword auto|break|case|char|const|continue|default|do|double|else
digit [0-9]
letter [a-zA-Z]
id (_|{letter})(_|{letter}|{digit})*

%%
{keyword} { fprintf(yyout,"%s",yytext); fprintf(yyout,"%s","-keyword");}
{digit} {}
{id} {}
.|\n {}
%%
int yywrap() {return 1;}

int main(){
	yyin = fopen("test.c","r");
	yyout = fopen("output.txt","w");
	yylex();
	return 0;
}
