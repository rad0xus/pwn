%{
  #include <stdio.h>
  #include <stdlib.h>

  void yyerror(const char *s);
  int yylex(void);
%}

%token NUMBER NEWLINE
%token PLUS MINUS MULTIPLY DIVIDE

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

/* Loop to continuously accept input until CTRL+C or CTRL+Z */
input:
    /* empty */
  | input line
;

line:
    NEWLINE
  | expr NEWLINE { printf("Result = %d\n", $1); fflush(stdout); }
;

expr:
    NUMBER                  { $$ = $1; }
  | expr PLUS expr          { $$ = $1 + $3; }
  | expr MINUS expr         { $$ = $1 - $3; }
  | expr MULTIPLY expr      { $$ = $1 * $3; }
  | expr DIVIDE expr        { 
                              if ($3 == 0) {
                                  yyerror("Division by zero");
                                  exit(1);
                              }
                              $$ = $1 / $3; 
                            }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse Error: %s\n", s);
}

int main() {
    printf("Enter expression:\n");
    fflush(stdout);
    yyparse();
    return 0;
}