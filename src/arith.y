%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%token  NUMBER
%left   SAL SAR SHL SHR
%left   ADD SUB
%left   EXP DIV MOD MUL
%token  OP CP ABS
%token  EOL

%%

start   : /* nothing */
        | start expr EOL        { printf("\e[33m= \e[32m%d\n\e[33m> \e[0m", $2); }
        | start EOL             { printf("\e[33m>\e[0m "); } /* blank line or a comment */
        ;

expr    : shiftop
        ;

shiftop : addop
        | expr SHR addop        { $$ = (unsigned int)$1 >> $3; }
        | expr SHL addop        { $$ = (unsigned int)$1 << $3; }
        | expr SAR addop        { $$ = $1 >> $3; }
        | expr SAL addop        { $$ = $1 << $3; }

addop   : mulop
        | addop ADD mulop       { $$ = $1 + $3; }
        | addop SUB mulop       { $$ = $1 - $3; }
        ;

mulop   : uniary
        | mulop MUL uniary      { $$ = $1 * $3; }
        | mulop MOD uniary      { $$ = $1 % $3; }
        | mulop DIV uniary      { $$ = $1 / $3; }
        | mulop EXP uniary      { $$ = pow($1, $3); }

uniary  : term
        | ADD term              { $$ = $2; }
        | SUB term              { $$ = -$2; }

term    : NUMBER
        | OP expr CP            { $$ = $2; }
        | ABS expr ABS          { $$ = abs($2); }
        ;

%%
