%{
   int currLine = 1, currPos = 1;
%}

DIGIT    [0-9]
ID [a-z]+
txt	[0-9]
   
%%

"-"            {printf("SUB\n"); currPos += yyleng;}
"+"            {printf("ADD\n"); currPos += yyleng;}
"*"            {printf("MULT\n"); currPos += yyleng;}
"/"            {printf("DIV\n"); currPos += yyleng;}
"="            {printf("E\n"); currPos += yyleng;}
"("            {printf("L_PAREN\n"); currPos += yyleng;}
")"            {printf("R_PAREN\n"); currPos += yyleng;}
";"	       {printf("semicolon\n"); currPos += yyleng;}
":"		{printf("colon\n"); currPos += yyleng;}
"<"		{printf("LT"); currPos += yyleng;}
"_"		{printf("_"); currPos += yyleng;}

{ID}+"_"{ID}*	{printf("%s\n", yytext); currPos += yyleng;}

":="		{printf("assign\n"); currPos += yyleng;}

{DIGIT}+       {printf("NUMBER %s\n", yytext); currPos += yyleng;}

"	"	{printf("INDENT "); currPos += yyleng;}

[ \t]+         {currPos += yyleng;}

"\n"           {currLine++; currPos = 1;}

{ID}		printf("%s\n", yytext);




%%

int main(int argc, char ** argv)
{
   if(argc >= 2)
   {
      yyin = fopen(argv[1], "r");
      if(yyin == NULL)
      {
         yyin = stdin;
      }
   }
   else
   {
      yyin = stdin;
   }
   yylex();
}
