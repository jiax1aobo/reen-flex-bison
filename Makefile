all: demo

BISON = bison
FLEX = flex

bison-out = demo.tab.c
flex-out  = lex.yy.c

BISON_FLAGS += -d

demo: main.c $(bison-out) $(flex-out)
	$(CC) $(CFLAGS) $^

$(flex-out): demo.l
	$(FLEX) $^

$(bison-out): demo.y
	$(BISON) $(BISON_FLAGS) $^

clean:
	$(RM) demo.tab.c demo.tab.h
	$(RM) lex.yy.c
	$(RM) a.out

