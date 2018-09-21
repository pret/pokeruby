CC = gcc

CFLAGS = -Wall -Wno-switch -Werror -std=c11 -O2

LIBS = -lm

SRCS = main.c extended.c

.SUFFIXES:

.PHONY: all clean

all: aif2pcm
	@:

aif2pcm: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) aif2pcm aif2pcm.exe
