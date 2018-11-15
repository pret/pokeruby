ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#
TOOLS_DIR ?= ..
RSFONT_DIR := $(basename $(TOOLS_DIR)/rsfont)
RSFONT ?= $(RSFONT_DIR)/rsfont$(EXE)
CC ?= gcc

CFLAGS := -Wall -Wextra -Werror -std=c11 -O2 -DPNG_SKIP_SETJMP_CHECK
RSFONT_CPPFLAGS :=  $(shell $(SHELL) $(RSFONT_DIR)/setjmp.sh $(CC) $(CFLAGS))
RSFONT_LIBS := -lpng -lz


RSFONT_SRCS := $(addprefix $(RSFONT_DIR)/,main.c convert_png.c util.c font.c)
RSFONT_OBJS := $(RSFONT_SRCS:.c=.o)
RSFONT_HEADERS := $(addprefix $(RSFONT_DIR)/,convert_png.h gfx.h global.h util.h font.h)

.PHONY: rsfont_all clean rsfont_clean

rsfont_all: $(RSFONT)

$(RSFONT): $(RSFONT_OBJS)
	@$(ECHO) " CCLD   $@"
	$(CC) $(CFLAGS) $(RSFONT_OBJS) -s -o $@ $(LDFLAGS) $(RSFONT_LIBS)

$(RSFONT_OBJS): %.o: %.c $(RSFONT_HEADERS)
	@$(ECHO) " CC     $@"
	$(CC) $(RSFONT_CPPFLAGS) $(CFLAGS) -c $< -o $@

clean: rsfont_clean
rsfont_clean:
	$(RM) $(RSFONT) $(RSFONT_OBJS)
