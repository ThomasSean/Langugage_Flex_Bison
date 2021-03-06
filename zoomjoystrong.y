/***********************************************************************

 * The following program is a way to run a new programming language in
 * in order to draw basic shapes.
 *

 * @author Sean Thomas

 * @version Language-creation-flex-and-bison

 * @date 3/12/2018

 **********************************************************************/
%{
	#include <stdio.h>
	void yyerror(const char* msg);
	int yylex();
%}

%error-verbose
%start program

%union { int i; double j; char* str; }

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT


%type<i> INT
%type<j> FLOAT

%%

program:	language_list END;
language_list:  language
             |  language language_list
;

language:	point
	 |	line 
	 | 	circle
	 |	rectangle
	 |	set_color
;


point:		POINT INT INT END_STATEMENT
		{ printf("%d %d ;", $2, $3); }
;


line:		LINE INT INT INT INT END_STATEMENT
		{ printf("%d %d %d %d ;", $2, $3, $4, $5);	}
;

circle:		CIRCLE INT INT INT END_STATEMENT
		{ printf("%d %d %d ;", $2, $3, $4); }
;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{ printf("%d %d %d %d ;", $2, $3, $4, $5); }
;

set_color:	SET_COLOR INT INT INT END_STATEMENT
		{ printf("%d %d %d ;", $2, $3, $4); }
;
%%
/*
	*Main method to run the program. Takes multiple arguments.
	*@param argc Name of argument statement
	*@param argv All following arguments
	*@return 0 returns 0 to end without errors
*/
int main(int argc, char** argv){
	yyparse();
	return 0;
}
/*
	*yyerror method runs if any error is reported and messages
	*user about the error.
	*@param msg takes the variable that is causing issues
	*	and prints it for user to see.
*/
void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s\n", msg);
}
