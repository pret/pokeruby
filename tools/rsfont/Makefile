CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s

SRCS = main.c convert_png.c util.c font.c lodepng.c

.PHONY: clean

rsfont: $(SRCS) convert_png.h gfx.h global.h util.h font.h lodepng.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) rsfont rsfont.exe
