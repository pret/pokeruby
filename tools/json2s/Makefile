CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s -DPNG_SKIP_SETJMP_CHECK

LIBS = -lpng -lz

SRCS = main.c util.c cJSON.c

.PHONY: all clean

all: json2s
	@:

json2s: $(SRCS) global.h util.h cJSON.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) json2s json2s.exe
