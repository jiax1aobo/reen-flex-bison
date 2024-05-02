/**
 * @note for reentrant parser
 * <BR>  use %pure-parser for old version
 */
%define api.pure full
/* =>int yyparse(yyscan_t, myextra *) */
%parse-param {yyscan_t scanner}
%parse-param {myextra *param}
/* =>int yylex(YYSTYPE *, yyscan_t) */
%lex-param {yyscan_t scanner}

%code top {
#include <stdio.h>
}

%code requires {
/* struct myextra */
#include "demo.h"
/* for yyscan_t */
#define YY_TYPEDEF_YY_SCANNER_T
typedef void *yyscan_t;
/* for YYLTYPE */
#define YYLTYPE uint32_t
#define YYLLOC_DEFAULT(Current, Rhs, N) do { \
	if ((N) > 0) { \
		(Current) = (Rhs)[1]; \
	} else { \
		(Current) = (-1); \
	} \
} while (0)
}

%code provides {
/**
 * @note would be provided to caller of parser()
 */
extern int yylex_init(yyscan_t *);
extern int yylex_destroy(yyscan_t);
}

%code {
/**
 * @note would be provided to parser() itself
 */
extern int yylex(YYSTYPE *, yyscan_t);
extern void yyerror(yyscan_t, myextra *, char *);
}

%union {
	int ival;
}

%%

begin: {}

%%

void yyerror(yyscan_t scanner, myextra *param, char *msg) {
	fprintf(stderr, "[ERROR] %s", msg);
}