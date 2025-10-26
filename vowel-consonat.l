/* A lex program to find out total number of vowels and consonants from the input string*/

%option noyywrap
%{
        #include <stdio.h>
        int vowels = 0, consonants = 0;
%}
%%
[aeiouAEIOU]    {vowels++;}
[a-zA-Z]        {consonants++;}
.
\n      {return 0;}

%%
int main(int argc, char *argv[])
{
        yyin = fopen(argv[1], "r");
        yylex();
        printf("Vowel count = %d\nConsonant count = %d\n", vowels, consonants);
        fclose(yyin);
        return 0;
}
