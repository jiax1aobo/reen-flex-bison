an reentrant flex & bison

bison:
	Needs definition of `yyscan_t'.
		it's definied in lex.yy.h
		if no lex.yy.h made,
		define yyscan_t in grammar file

flex:
	Needs definition of `YYSTYPE',
		it's defined in demo.tab.h
