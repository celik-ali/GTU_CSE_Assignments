%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}


%%
        /* Keywords */
and     {return KW_AND;}
or      {return KW_OR;}
not     {return KW_NOT;}
equal   {return KW_EQUAL;}
less    {return KW_LESS;}
nil     {return KW_NIL;}
list    {return KW_LIST;}
append  {return KW_APPEND;}
concat  {return KW_CONCAT;}
set     {return KW_SET;}
def     {return KW_DEF;}
for     {return KW_FOR;}
if      {return KW_IF;}
exit    {return KW_EXIT;}
load    {return KW_LOAD;}
display {return KW_DISP;}
true    {return KW_TRUE;}
false   {return KW_FALSE;}
TRM   {printf("Terminating\n");exit(0);}

        /* Operators */
[+]     {return OP_PLUS;}
[-]     {return OP_MINUS;}
[/]     {return OP_DIV;}
[*]     {return OP_MULT;}
[(]     {return OP_OP;}
[)]     {return OP_CP;}
[,]     {return OP_COMMA;}

        /*Comment*/
[;][;].*   {return COMMENT;}

        /*Valuef*/
[0-9]+[b][1-9]+     { yylval.string = strdup(yytext); return VALUEF; }

        /*Identifier*/
[a-zA-Z][a-zA-Z0-9]*    {yylval.string = strdup(yytext); return IDENTIFIER;}



[ \t\n]+ { /* Ignore whitespace and newlines */ }
-[a-zA-Z0-9]"."*[0-9]*|[0-9]+[a-zA-Z]*[0-9]*|[0-9]+[b][0]+|.            {printf("SYNTAX_ERROR %s cannot be tokenized\n", yytext);} //If it is needed we can put exit(0); after; so that program terminates at the first synatx error. 

%%
