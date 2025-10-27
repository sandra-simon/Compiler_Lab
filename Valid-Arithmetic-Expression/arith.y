%{
        #include <stdio.h>
        #include <stdlib.h>

        void yyerror(const char *s);
        int yylex(void);
%}

%token NUMBER ALPHA
%left '+''-'
%left '*''/'
%left UMINUS

%%

input:
        |input line
        ;

line:
        expr '\n'       {printf("valid expression\n");}
        ;

expr:
        expr '+' expr
        |expr '-' expr
        |expr '*' expr
        |expr '/' expr
        |'-' expr %prec UMINUS
        |'(' expr ')'
        |NUMBER
        |ALPHA
        ;

%%

void yyerror(const char *s)
{
        printf("Invalid expression\n");
}

int main(void)
{
        printf("Enter an arithmetic expression:\n");
        return yyparse();
}
