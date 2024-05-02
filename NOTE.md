# An reentrant flex & bison

> CONTACT ME: `x1aobo@foxmail.com`

**READ BISON'S MANUAL SECTION `PROLOGUE ALTERNATIVE` FOR DETAIL,**
**IT CAN HELP YOU TO AVOID THE PROBLEM OF 'Circular Dependency Problem',**
**MAINLY ABOUT `yyscan_t` AND `YYSTYPE`.**

```
bison:
	Needs definition of `yyscan_t'.
		definied in lex.yy.c

flex:
	Needs definition of `YYSTYPE',
		defined in demo.tab.c and demo.tab.h (if have)
```