#include <stdio.h>

int main() {
  printf("> "); 
  yyparse();
  return 0;
}

int yyerror(char *s) {
  fprintf(stderr, "\x1b[91merror: %s\n\x1b[0m", s);
  return 0;
}