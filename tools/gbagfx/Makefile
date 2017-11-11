CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c lodepng.c

.PHONY: clean

gbagfx: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h lodepng.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) gbagfx gbagfx.exe
