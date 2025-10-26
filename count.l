/* write a lex program to display number of lines, words and characters in an input text */

%option noyywrap
%{
        #include<stdio.h>
        int words=0, chars=0, lines=0;
%}
%%
\n      {lines++;}
[a-zA-Z0-9]+    {words++;chars+=yyleng;}
.       {chars++;}
%%
int main(int argc, char *argv[])
{
        yyin=fopen(argv[1], "r");
        yylex();
        printf("Total words = %d\n", words);
        printf("Total chars = %d\n", chars);
        printf("Total lines = %d\n", lines);
        fclose(yyin);
}
