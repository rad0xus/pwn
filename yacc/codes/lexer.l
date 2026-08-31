%{
  #include <stdio.h>
  #include <stdlib.h>
%}
/*
  yytext: 
  yywrap:
  yylex:
*/
%%
[0-9]+ {printf("<INTEGER, %s>", yytext);}
[ \t\n] {}
/*Validity checks to remove useless characters*/
. {print("ERROR");}
%%

int yywrap() {return 1;}

int main(){
  while(yylex());
  return 0;
}
