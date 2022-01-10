%{
	int vowel_count=0;
	int const_count=0;
%}

%%
[aeiouAEIOU] {vowel_count ++;}
[a-zA-Z] {const_count ++;}
%%

int yywrap() {}

int main(){
	printf("Enter the string:");
	yylex();
	printf("Vowels: %d\n",vowel_count);
	printf("Consonants: %d\n",const_count);
	return 0;
}
