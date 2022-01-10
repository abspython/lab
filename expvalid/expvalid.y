%{
#include<stdio.h>
#include<stdlib.h>
yylex();
%}

%token NUM ID
%left '+' '-'
%left '*' '/'

%%
e: e '+' e
 | e '-' e
 | e '/' e
 | e '*' e
 | '(' e ')'
 | NUM
 | ID;
%%

main(){
	printf("Enter the string\n");
	yyparse();
	printf("Valid ID");
}

yyerror(){
	printf("Invalid ID");
	exit(0);
}
