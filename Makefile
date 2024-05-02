all: demo

bison-out = demo.tab.c
flex-out  = lex.yy.c

# CFLAGS += -ll

demo: $(bison-out) $(flex-out)
	$(CC) $(CFLAGS) $^

$(flex-out): demo.l
	flex $^

$(bison-out): demo.y
	bison -d $^

clean:
	$(RM) demo.tab.c demo.tab.h
	$(RM) lex.yy.c
	$(RM) a.out

