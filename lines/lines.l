%{
	int l=0,c=0,s=0,w=0;
%}

%%
[  ] {s++;w++;}
[a-zA-Z] {c++;}
[\t\.] {w++;}
[\n] {l++;w++;}
%%

int yywrap() {return 1;}

int main(){
	printf("Enter the string:");
	yylex();
	printf("%d %d %d %d\n",l,c,s,w);
	return 0;
}
