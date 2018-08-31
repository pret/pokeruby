CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s -DPNG_SKIP_SETJMP_CHECK $(shell ./setjmp.sh $(CC))

LIBS = -lpng -lz

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c
OBJS = $(SRCS:.c=.o)
HEADERS = convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
.PHONY: all clean

all: gbagfx
	@:

$(OBJS): %.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) $< -c -o $@

gbagfx: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) *.o
	$(RM) gbagfx gbagfx.exe
