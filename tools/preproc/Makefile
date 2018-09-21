CC := gcc

CFLAGS := -std=c99 -Og -g -Wall -Wno-switch -Werror
LDFLAGS :=
SRCS := asm_file.c c_file.c charmap.c preproc.c string_parser.c \
	utf8.c stack.c my_string.c hash_map.c
OBJS := $(SRCS:.c=.o)
HEADERS := asm_file.h c_file.h char_util.h charmap.h preproc.h string_parser.h \
	utf8.h stack.h hash_map.h

.PHONY: all clean
.SUFFIXES:
all: preproc
	@:

libucpp.a:  $(wildcard ucpp/*)
	cd ucpp && $(MAKE) STAND_ALONE=
	cp ucpp/libucpp.a libucpp.a

preproc: $(OBJS) libucpp.a
	$(CC) $(OBJS) libucpp.a -o $@ $(LDFLAGS)

$(OBJS): %.o: %.c $(HEADERS)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) preproc preproc.exe
	$(MAKE) -C ucpp clean
	$(RM) $(OBJS)
