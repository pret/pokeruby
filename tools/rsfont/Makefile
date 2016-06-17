CC = gcc

CFLAGS = -Wall -Wextra -std=c11 -O2 -DPNG_SKIP_SETJMP_CHECK

LIBS = -lz -lpng

SRCS = main.c convert_png.c util.c font.c

.PHONY: clean

rsfont: $(SRCS) convert_png.h gfx.h global.h util.h font.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LIBS)

clean:
	$(RM) rsfont rsfont.exe
