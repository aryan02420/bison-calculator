%{
#include "arith.tab.h"
%}

%%
"+"	    { return ADD; }
"-"	    { return SUB; }
"*"	    { return MUL; }
"/"	    { return DIV; }
"%"	    { return MOD; }
"^"     { return EXP; }
"<<"    { return SHL; }
">>"    { return SHR; }
"<<<"   { return SAL; }
">>>"   { return SAR; }
"|"     { return ABS; }
"("     { return OP; }
")"     { return CP; }
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
"//".*  { /* ignore comments */ }
[ \t]   { /* ignore white space */ }
.	    { yyerror("Mystery character %c\n", *yytext); }
%%