ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#
TOOLS_DIR ?= ..
GBAGFX_DIR := $(basename $(TOOLS_DIR)/gbagfx)
GFX ?= $(GBAGFX_DIR)/gbagfx$(EXE)

CC ?= gcc

CFLAGS := -Wall -Wextra -Werror -std=c11 -O2

GBAGFX_CPPFLAGS := -DPNG_SKIP_SETJMP_CHECK $(shell $(SHELL) $(GBAGFX_DIR)/setjmp.sh $(CC) $(CFLAGS))

GBAGFX_LIBS = -lpng -lz

GBAGFX_SRCS = $(addprefix $(GBAGFX_DIR)/,main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c)
GBAGFX_OBJS = $(GBAGFX_SRCS:.c=.o)
GBAGFX_HEADERS = $(addprefix $(GBAGFX_DIR)/,convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h)
.PHONY: clean gbagfx_clean gbagfx_all

gbagfx_all: $(GFX)

$(GFX): $(GBAGFX_OBJS)
	@$(ECHO) " CCLD   $@"
	$(CC) $(CFLAGS) $(GBAGFX_OBJS) -o $@ $(LDFLAGS) $(GBAGFX_LIBS)

$(GBAGFX_OBJS): %.o: %.c $(GBAGFX_HEADERS)
	@$(ECHO) " CC     $@"
	$(CC) $(GBAGFX_CPPFLAGS) $(CFLAGS) $< -c -o $@

clean: gbagfx_clean
gbagfx_clean:
	$(RM) $(GBAGFX_OBJS) $(GFX)
