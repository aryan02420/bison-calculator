#include <stdio.h>

int main() {
  printf("\e[33m>\e[0m "); 
  yyparse();
  return 0;
}

int yyerror(char *s) {
  fprintf(stderr, "\e[31merror: %s\n\e[0m", s);
  return 0;
}