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
[0-9]+ {printf("<INTEGER, %s>\n", yytext);}
[ \t\n] {}
  /*Validity checks to remove useless characters*/
. {printf("ERROR\n");}  
"exit" {return 0;}
%%

int yywrap() {return 1;}

int main(){
  while(yylex());
  return 0;
}
