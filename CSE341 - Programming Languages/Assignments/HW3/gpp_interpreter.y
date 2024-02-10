%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FUNCTIONS 100 // Preprocessor directives for setting the maximum number of functions and parameters.
#define MAX_PARAMS 3

// Struct to represent a function in the G++ language.
typedef struct {
    char functionName[50];           // Name of the function.
    char* parameters[MAX_PARAMS];    // Parameters for the function.
    char body[200];                  // Body of the function as a string.
} Function;


Function functionTable[MAX_FUNCTIONS]; // Function type table to store defined functions by user
int functionCount = 0; // Counter to keep track of the number of functions defined.

extern int yylex(); // External declarations for functions provided by Flex.
extern char* yytext;
extern int yylineno;
void yyerror(const char *s); // Error handling function declaration.
char* getResult(char* s1, char* s2, char opA); // Function to calculate operation results with VALUEF type
void printExpResult(char* fractionResult); // Function to print expression result.
void defineFunction(char* functionName, char* arg1, char* arg2, char* arg3, char* body);  // Function to storing operations a new defined function
char* callFunction(char* functionName, char* arg1, char* arg2, char* arg3); // Function to call a previously defined function
%}


%union{ 
  char* string;
}
//KW TOKENS
%token KW_AND
%token KW_OR
%token KW_NOT
%token KW_EQUAL
%token KW_LESS
%token KW_NIL
%token KW_LIST
%token KW_APPEND
%token KW_CONCAT
%token KW_SET
%token KW_DEF
%token KW_FOR
%token KW_IF
%token KW_EXIT
%token KW_LOAD
%token KW_DISP
%token KW_TRUE
%token KW_FALSE


//OP TOKENS
%token OP_PLUS
%token OP_MINUS
%token OP_DIV
%token OP_MULT
%token OP_OP
%token OP_CP
%token OP_COMMA

//Comment TOKEN
%token COMMENT

//VALUEF TOKEN
%token <string> VALUEF

//Identifier TOKEN
%token <string> IDENTIFIER
// Non-terminal symbols
%type <string> EXP
%type <string> FUNCTION
//  Start symbol
%start START

%%
//Rules for non-terminal symbols
START: EXP {printExpResult($1);}
      |FUNCTION
      |COMMENT {;}
      |OP_OP KW_EXIT OP_CP {exit(0);}
      ;

EXP: OP_OP OP_PLUS EXP EXP OP_CP {$$ = getResult($3,$4,'+');}
    |OP_OP OP_MINUS EXP EXP OP_CP {$$ = getResult($3,$4,'-');}
    |OP_OP OP_MULT EXP EXP OP_CP {$$ = getResult($3,$4,'*');}
    |OP_OP OP_DIV EXP EXP OP_CP {$$ = getResult($3,$4,'/');}
    |OP_OP IDENTIFIER EXP OP_CP { $$ = callFunction($2, $3, NULL, NULL); }
    |OP_OP IDENTIFIER EXP EXP OP_CP { $$ = callFunction($2, $3, $4, NULL); }
    |OP_OP IDENTIFIER EXP EXP EXP OP_CP { $$ = callFunction($2, $3, $4, $5); }
    |IDENTIFIER {$$ = strdup($1);}
    |VALUEF {$$ = strdup($1);}
    ;

FUNCTION: OP_OP KW_DEF IDENTIFIER EXP OP_CP  { defineFunction($3, NULL, NULL, NULL, $4); }
        | OP_OP KW_DEF IDENTIFIER IDENTIFIER EXP OP_CP { defineFunction($3, $4, NULL, NULL, $5); }
        | OP_OP KW_DEF IDENTIFIER IDENTIFIER IDENTIFIER EXP OP_CP { defineFunction($3, $4, $5, NULL, $6); }
        | OP_OP KW_DEF IDENTIFIER IDENTIFIER IDENTIFIER IDENTIFIER EXP OP_CP  { defineFunction($3, $4, $5, $6, $7); }
        ;




%%

char* getResult(char* s1, char* s2, char opA) {
    
  void parseFraction(const char* frac, int* numerator, int* denominator)  // Function to parse a fraction string into numerator and denominator.
    {
        sscanf(frac, "%db%d", numerator, denominator);
    }
    
    int findGCD(int a, int b)// Function to find the greatest common divisor using Euclid's algorithm. For simplifying.
    {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}
    // Numerators and denominators for both VALUEFs and the result.
    int num1, den1, num2, den2, resNum, resDen;

    // Parse the fractions from the input strings.
    parseFraction(s1, &num1, &den1);
    parseFraction(s2, &num2, &den2);

    // Perform the arithmetic operation.
    switch (opA) {
        case '+': // Addition of fractions
            resNum = num1 * den2 + num2 * den1;
            resDen = den1 * den2;
            break;
        case '-': // Subtraction of fractions
            resNum = num1 * den2 - num2 * den1;
            resDen = den1 * den2;
            break;
        case '*': // Multiplication of fractions
            resNum = num1 * num2;
            resDen = den1 * den2;
            break;
        case '/': // Division of fractions
            resNum = num1 * den2;
            resDen = den1 * num2;
            break;
        default:
            fprintf(stderr, "Invalid operation.\n");
            exit(1);
    }

    
    char* ResultStr = (char*)malloc(50 * sizeof(char)); // Allocate memory for the result string.
    if (resDen == 1) {
        // If the denominator is 1, just print the numerator.
        sprintf(ResultStr, "%db%d", resNum, resDen);
    } else {
        // Simplify the fraction before printing.
        int gcd = findGCD(resNum, resDen); // Function to find the Greatest Common Divisor.
        resNum /= gcd;
        resDen /= gcd;
        sprintf(ResultStr, "%db%d", resNum, resDen);
    }

    return ResultStr;
}

void printExpResult(char* fractionResult) { // Fraction result is passed as integer(s)binteger(s) format
    int numerator, denominator;
    // Parse the string into numerator and denominator.
    if (sscanf(fractionResult, "%db%d", &numerator, &denominator) == 2) {
        // Print the fraction as it is.
        printf("%d/%d\n", numerator, denominator);
    } else {
        // Handle parsing error.
        fprintf(stderr, "Error: Invalid fraction format '%s'\n", fractionResult);
    }
}


void defineFunction(char* functionName, char* arg1, char* arg2, char* arg3, char* body) {
    if (functionCount >= MAX_FUNCTIONS) {
        fprintf(stderr, "Error: Exceeded maximum number of functions\n");
        exit(1);
    }
    Function newFunction;  // Defining a function struct to store datas
    strcpy(newFunction.functionName, functionName);
    newFunction.parameters[0] = arg1 ? strdup(arg1) : NULL; // Using ternary operaitons for different parameter cases.
    newFunction.parameters[1] = arg2 ? strdup(arg2) : NULL;
    newFunction.parameters[2] = arg3 ? strdup(arg3) : NULL;
    strcpy(newFunction.body, body); // Ensure body is allocated and null-terminated
    functionTable[functionCount++] = newFunction;
    printf("#Function\n");
}

char* callFunction(char* functionName, char* arg1, char* arg2, char* arg3) {
    printf("Call function called\n");
    for (int i = 0; i < functionCount; ++i) {
        if (strcmp(functionTable[i].functionName, functionName) == 0) {
            return strdup(functionTable[i].body);
        }
    }
    fprintf(stderr, "Error: Function %s not defined\n", functionName);
    return NULL;
}

int main() {
    printf("G++ Interpreter\n");
    yyparse();
    return 0;
}

// Error handling function to print out error messages.
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);
}

