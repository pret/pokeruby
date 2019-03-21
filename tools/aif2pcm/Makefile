ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#

CC ?= gcc
TOOLS_DIR ?= ..
AIF2PCM_DIR := $(basename $(TOOLS_DIR)/aif2pcm)
AIF2PCM ?= $(AIF2PCM_DIR)/aif2pcm$(EXE)

CFLAGS := -Wall -Wextra -Wno-switch -Werror -std=c11 -O2
AIF2PCM_LIBS := -lm
AIF2PCM_SRCS := $(addprefix $(AIF2PCM_DIR)/, main.c extended.c)

aif2pcm_all: $(AIF2PCM)

$(AIF2PCM): $(AIF2PCM_SRCS)
	@$(ECHO) " CCLD   $@"
	$(CC) $(CFLAGS) $(AIF2PCM_SRCS) -s -o $@ $(LDFLAGS) $(AIF2PCM_LIBS)

clean: aif2pcm_clean
aif2pcm_clean:
	$(RM) $(AIF2PCM)

.PHONY: aif2pcm_all aif2pcm_clean clean
