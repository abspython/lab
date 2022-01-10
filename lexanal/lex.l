%{
%}

id [_|a-zA-Z][_|a-zA-Z0-9]*
key int|float|char|double|while|for|struct|do|if|break|switch|case|else|goto|return|typedef
rel ">="|"<="|"=="|"<"|">"|"!=="
log "||"|"&&"|"!"
art "*"|"+"|"-"|"/"


%%
"/*"(^"*/")"*/" {multicomment}
("//".*)/\n {singlecomment}
#.* {preprocessor}
{key} {key}
{id} {fun}
\{ {block1}
\} {block2}
{id}(\=[0-9]*)? {iden}
\".*\" {str}
[\+|\-]?[0-9]+(\.[0-9]+)? {num}
\)(\:)? {ECHO;printf("\n");}
\( {ECHO;}
\= {assignop}
{rel} {relop}
{art} {artop}
{log} {logop}
%%

int yywrap() { return 1; }

int main(){
	FILE* file;
	file = fopen("test.c","r");
	if(!file){
		printf("File not found!\n");
		exit(0);
	}
	yyin = file;
	yylex();
	return 0;
}
