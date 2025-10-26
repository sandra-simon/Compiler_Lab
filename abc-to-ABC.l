/* Write a lex program to convert the substring abc to ABC from given input string */

%option noyywrap
%{
        #include<stdio.h>
%}

%%
abc     {printf("ABC");}
.|\n    {printf("%s", yytext);}
%%

int main()
{
        printf("Enter a string: \n");
        yylex();
        return 0;
}
