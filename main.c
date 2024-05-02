#include "demo.tab.h"

int main(int argc, char **argv) {
	yyscan_t myscan;
	myextra extra;
	extra.scanner = &myscan;
	yylex_init(&myscan);
	yyparse(myscan, &extra);
	yylex_destroy(myscan);
	return 0;
}

