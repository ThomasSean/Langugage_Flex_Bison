%{
	#include "zoomjoystrong.tab.h"
	#include <stdlib.h>
%}

%option noyywrap

%%

[0-9]+				{ yylval.i = atoi(yytext); return INT; }
[0-9]+(\.[0-9]+)*		{ yylval.i = atoi(yytext); return FLOAT; }
point				{ return POINT; }
line				{ return LINE; }
circle				{ return CIRCLE; }
rectangle			{ return RECTANGLE; }
set_color			{ return SET_COLOR; }
END				{ return END; }
;				{ return END_STATEMENT; }
[ \t\n]				;
.				;

%%
