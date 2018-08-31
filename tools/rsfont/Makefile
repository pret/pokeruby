CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s -DPNG_SKIP_SETJMP_CHECK $(shell ./setjmp.sh $(CC))

LIBS = -lpng -lz

SRCS = main.c convert_png.c util.c font.c
OBJS = $(SRCS:.c=.o)
HEADERS =  convert_png.h gfx.h global.h util.h font.h

.PHONY: all clean

all: rsfont
	@:

$(OBJS): %.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

rsfont: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) *.o
	$(RM) rsfont rsfont.exe
