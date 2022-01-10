%{
#include<stdio.h>
int flag =0;
%}

%token NUMBER;
%%
ArthimeticExpression: e{printf("\nResult:\t%d\nValid expression",$$);return 0;}
e : e '+' e {$$ = $1 + $3;}
  | e '-' e {$$ = $1 - $3;}
  | e '*' e {$$ = $1 * $3;}
  | e '/' e {$$ = $1 / $3;}
  | '('e ')' {$$ = $2;}
  |NUMBER {$$ = $1;}
  | e '(' {yyerror();}
  | e e {yyerror();}
  | '-' e {$$ = - $2;};
%%

main(){
	printf("Enter the string\n");
	yyparse();
}

yyerror(){
	printf("Invalid expression");
	exit(0);
}
