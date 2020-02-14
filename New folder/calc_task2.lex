%{
   int currLine = 1, currPos = 1;
%}

DIGIT    [0-9]
ID [a-z]+

   
%%
"function"	{printf("FUNCTION\n"); currPos += yyleng;}
"beginparams"   {printf("BEGIN_PARAMS\n"); currPos += yyleng;}
"endparams"            {printf("END_PARAMS\n"); currPos += yyleng;}
"beginlocals"            {printf("BEGIN_LOCALS\n"); currPos += yyleng;}
"endlocals"            {printf("END_LOCALS\n"); currPos += yyleng;}
"beginbody"            {printf("BEGIN_BODY\n"); currPos += yyleng;}
"endbody"            {printf("END_BODY\n"); currPos += yyleng;}
"integer"            {printf("INTEGER\n"); currPos += yyleng;}
"array"	       {printf("ARRAY\n"); currPos += yyleng;}
"of"		{printf("OF\n"); currPos += yyleng;}
"if"		{printf("IF\n"); currPos += yyleng;}
"then"		{printf("THEN"); currPos += yyleng;}
"endif"		{printf("ENDIF\n"); currPos += yyleng;}
"else"            {printf("ELSE\n"); currPos += yyleng;}
"while"            {printf("WHILE\n"); currPos += yyleng;}
"do"            {printf("DO\n"); currPos += yyleng;}
"for"            {printf("FOR\n"); currPos += yyleng;}
"beginloop"            {printf("BEGINLOOP\n"); currPos += yyleng;}
"endloop"            {printf("ENDLOOP\n"); currPos += yyleng;}
"continue"            {printf("CONTINUE\n"); currPos += yyleng;}
"read"            {printf("READ\n"); currPos += yyleng;}
"write"            {printf("WRITE\n"); currPos += yyleng;}
"and"	       {printf("AND\n"); currPos += yyleng;}
"or"		{printf("OR\n"); currPos += yyleng;}
"not"		{printf("NOT\n"); currPos += yyleng;}
"true"		{printf("TRUE"); currPos += yyleng;}
"false"		{printf("FALSE\n"); currPos += yyleng;}
"return"            {printf("RETURN\n"); currPos += yyleng;}
"]"            {printf("r_square_bracket\n"); currPos += yyleng;}
"

"-"            {printf("SUB\n"); currPos += yyleng;}
"+"            {printf("ADD\n"); currPos += yyleng;}
"*"            {printf("MULT\n"); currPos += yyleng;}
"/"            {printf("DIV\n"); currPos += yyleng;}
"="            {printf("E\n"); currPos += yyleng;}
"("            {printf("L_PAREN\n"); currPos += yyleng;}
")"            {printf("R_PAREN\n"); currPos += yyleng;}
";"	       {printf("semicolon\n"); currPos += yyleng;}
":"		{printf("colon\n"); currPos += yyleng;}
"<"		{printf("lt\n"); currPos += yyleng;}
"_"		{printf("_"); currPos += yyleng;}
","		{printf("comma\n"); currPos += yyleng;}
"["            {printf("l_square_bracket\n"); currPos += yyleng;}
"]"            {printf("r_square_bracket\n"); currPos += yyleng;}
"%"            {printf("%\n"); currPos += yyleng;}
i"=="            {printf("==\n"); currPos += yyleng;}
">="            {printf("gte\n"); currPos += yyleng;}
">"		{printf("gt\n"); currPos += yyleng;}

{ID}+"_"{ID}*	{printf("%s\n", yytext); currPos += yyleng;}

":="		{printf("assign\n"); currPos += yyleng;}

{DIGIT}+       {printf("NUMBER %s\n", yytext); currPos += yyleng;}

[ \t]+         {currPos += yyleng;}

"\n"           {currLine++; currPos = 1;}

 


"##".*		 {}


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
