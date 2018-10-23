CC := gcc

CFLAGS := -std=gnu11 -O2 -Wall -Wno-switch
LDFLAGS :=
SRCS := asm_file.c c_file.c charmap.c preproc.c  \
	utf8.c stack.c pragma_parser.c string_parser.c
OBJS := $(SRCS:.c=.o)
HEADERS := asm_file.h c_file.h char_util.h charmap.h preproc.h string_parser.h \
	utf8.h stack.h khash.h pragma_parser.h

.PHONY: all clean
.SUFFIXES:
all: preproc
	@:

# note: SEMPER_FIDELIS is the define that makes ucpp handle whitespace.
ucpp/libucpp.a:  $(wildcard ucpp/*.[ch])
	cd ucpp && $(MAKE) STAND_ALONE=  CC="$(CC)" CFLAGS="$(CFLAGS) -DSEMPER_FIDELIS"

preproc: $(OBJS) ucpp/libucpp.a
	$(CC) $(OBJS) $(CFLAGS) ucpp/libucpp.a -o $@ $(LDFLAGS)

$(OBJS): %.o: %.c $(HEADERS)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) preproc preproc.exe
	$(MAKE) -C ucpp clean
	$(RM) $(OBJS)
