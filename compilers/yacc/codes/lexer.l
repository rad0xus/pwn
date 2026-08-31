%{
  #include <stdio.h>
  #include "parser.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULTIPLY; }
"/"         { return DIVIDE; }
\n          { return NEWLINE; }
[ \t]       ; /* Ignore spaces and tabs */
.           { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}