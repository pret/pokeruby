CC = gcc

SRCS = gbafix.c

.PHONY: all clean

all: gbafix
	@:

gbafix: $(SRCS)
	$(CC) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) gbafix gbafix.exe
