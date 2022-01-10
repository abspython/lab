%{
#include<stdio.h>
#include<stdlib.h>
yylex();
%}

%token LETTER DIGIT UND NL;
%%
start: S NL {printf("Valid ID");exit(0);}
S: LETTER C | UND C | LETTER;
C: LETTER C | LETTER | DIGIT | DIGIT C | UND C;
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
