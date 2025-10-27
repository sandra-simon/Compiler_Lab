%{
        #include "y.tab.h"

        extern int isValid;
%}

%%

[a-zA-Z][a-zA-Z0-9_]*   {return IDENTIFIER;}
[\t]    ;
\n      {return '\n';}
.       {printf("Invalid identifier: %s\n", yytext);
        isValid=0;}

%%

int yywrap()
{
        return 1;
}
