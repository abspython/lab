%{
	#include<stdio.h>
	int flag=0,op1=0,op2=0,optr;
%}

%%
[*] {optr=1;}
[/] {optr=2;}
[+] {optr=3;}
[-] {optr=4;}
[0-9]+ {
	if(flag == 0){
		op1 = atoi(yytext);
		flag = 1;
	}else{
		op2 = atoi(yytext);
		switch(optr){
			case 1: printf("Result: %d",op1*op2);break;
			case 2: printf("Result: %d",op1/op2);break;
			case 3: printf("Result: %d",op1+op2);break;
			case 4: printf("Result: %d",op1-op2);break;
		}
	}
}
%%

int yywrap() {return 1;}

int main(){
printf("Enter operation:");
yylex();
return 0;
}
