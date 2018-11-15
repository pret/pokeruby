ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#

CC := gcc
TOOLS_DIR ?= ..
PREPROC_DIR := $(basename $(TOOLS_DIR)/preproc)
PREPROC ?= $(PREPROC_DIR)/preproc$(EXE)

PREPROC_CFLAGS := -std=gnu11 -O2 -Wall -Wno-switch
LDFLAGS :=
PREPROC_SRCS := $(addprefix $(PREPROC_DIR)/,asm_file.c c_file.c charmap.c preproc.c  \
	utf8.c stack.c pragma_parser.c string_parser.c)
PREPROC_OBJS := $(PREPROC_SRCS:.c=.o)
PREPROC_HEADERS := $(addprefix $(PREPROC_DIR)/,asm_file.h c_file.h char_util.h charmap.h preproc.h string_parser.h \
	utf8.h stack.h khash.h pragma_parser.h)

.PHONY: preproc_all preproc_clean
.SUFFIXES:
preproc_all: $(PREPROC)
	@:

# note: SEMPER_FIDELIS is the define that makes ucpp handle whitespace.
$(PREPROC_DIR)/ucpp/libucpp.a:  $(wildcard $(PREPROC_DIR)/ucpp/*.[ch])
	@$(ECHO) " MAKE   ucpp"
	cd $(PREPROC_DIR)/ucpp && $(MAKE) STAND_ALONE=  CC="$(CC)" CFLAGS="$(PREPROC_CFLAGS) -DSEMPER_FIDELIS"

$(PREPROC): $(PREPROC_OBJS) $(PREPROC_DIR)/ucpp/libucpp.a
	@$(ECHO) " CCLD   $@"
	$(CC) $(PREPROC_OBJS) $(PREPROC_CFLAGS) $(PREPROC_DIR)/ucpp/libucpp.a -o $@ $(LDFLAGS)

$(PREPROC_OBJS): %.o: %.c $(PREPROC_HEADERS)
	@$(ECHO) " CC     $@"
	$(CC) -c $(PREPROC_CFLAGS) $< -o $@

clean: preproc_clean
preproc_clean:
	$(RM) $(PREPROC)
	$(MAKE) -C $(PREPROC_DIR)/ucpp clean
	$(RM) $(PREPROC_OBJS)
