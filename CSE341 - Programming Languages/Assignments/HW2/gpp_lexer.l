%{

%}


%%
        /* Keywords */
and     {printf("KW_AND\n");}
or      {printf("KW_OR\n");}
not     {printf("KW_NOT\n");}
equal   {printf("KW_EQUAL\n");}
less    {printf("KW_LESS\n");}
nil     {printf("KW_NIL\n");}
list    {printf("KW_LIST\n");}
append  {printf("KW_APPEND\n");}
concat  {printf("KW_CONCAT\n");}
set     {printf("KW_SET\n");}
def     {printf("KW_DEF\n");}
for     {printf("KW_FOR\n");}
if      {printf("KW_IF\n");}
exit    {printf("KW_EXIT\n"); exit(0);}
load    {printf("KW_LOAD\n");}
display {printf("KW_DISPLAY\n");}
true    {printf("KW_TRUE\n");}
false   {printf("KW_FALSE\n");}
TRM   {printf("Terminating\n");exit(0);}

        /* Operators */
[+]     {printf("OP_PLUS\n");}
[-]     {printf("OP_MINUS\n");}
[/]     {printf("OP_DIV\n");}
[*]     {printf("OP_MULT\n");}
[(]     {printf("OP_OP\n");}
[)]     {printf("OP_CP\n");}
[,]     {printf("OP_COMMA\n");}

        /*Comment*/
[;][;].*   {printf("COMMENT\n");}

        /*Valuef*/
[0-9]+[b][1-9]+     {printf("VALUEF\n");}

        /*Identifier*/
[a-zA-Z][a-zA-Z0-9]*    {printf("IDENTIFIER\n");}


[ \t\n]+ { /* Ignore whitespace and newlines */ }
-[a-zA-Z0-9]"."*[0-9]*|[0-9]+[a-zA-Z]*[0-9]*|[0-9]+[b][0]+|.            {printf("SYNTAX_ERROR %s cannot be tokenized\n", yytext);} //If it is needed we can put exit(0); after; so that program terminates at the first synatx error. 

%%

int yywrap(){} /* yywrap is checking whether still an input is comming or not or did the pointer reached EOF(for files). 
                           If there is no input comming it returns 1 by default, else returns 0. */
int main(int argc, char *argv[]){
    if (argc == 1){             // while executing 
        printf("(Type exit or TRM to terminate)| Enter your string: \n");
        yylex();            //Starts tokenization process
        
    }
    else if(argc == 2){
        yyin = fopen(argv[1], "r"); //If we want to tokenize a file to the program as a command-line arguments. This line will take it as argv[1] and pass it to the yyin. yyin is a input stream pointer.
        yylex();
        fclose(yyin);
    }
    return 0;
}