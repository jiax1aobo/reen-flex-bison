%code top { #include <stdio.h> }

%code requires {
/* struct myextra */
#include "demo.h"
#define YY_TYPEDEF_YY_SCANNER_T
typedef void *yyscan_t;
}

%code {

int yylex_init(yyscan_t *);
int yylex(YYSTYPE *, yyscan_t);
int yylex_destroy(yyscan_t);
void yyerror(yyscan_t, myextra *, char *);

}

/* reentrant parser */
/* %pure-parser // old version */
%define api.pure full
/* =>int yyparse(yyscan_t, myextra *) */
%parse-param {yyscan_t scanner}
%parse-param {myextra *param}
/* =>int yylex(YYSTYPE *, yyscan_t) */
%lex-param {yyscan_t scanner}

%union {
	int ival;
}

%%

begin: {}

%%

int main(int argc, char **argv) {
	yyscan_t myscan;
	myextra extra;
	extra.scanner = &myscan;
	yylex_init(&myscan);
	yyparse(myscan, &extra);
	yylex_destroy(myscan);
	return 0;
}

void yyerror(yyscan_t scanner, myextra *param, char *msg) {
	fprintf(stderr, "[ERROR] %s", msg);
}
