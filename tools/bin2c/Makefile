ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#

CC ?= gcc
TOOLS_DIR ?= ..
BIN2C_DIR := $(basename $(TOOLS_DIR)/bin2c)
BIN2C ?= $(BIN2C_DIR)/bin2c$(EXE)

CFLAGS := -Wall -Wextra -Werror -std=c11 -O2 -s

BIN2C_SRCS := $(BIN2C_DIR)/bin2c.c

.PHONY: clean bin2c_clean bin2c_all

bin2c_all: $(BIN2C)

$(BIN2C): $(BIN2C_SRCS)
	@$(ECHO) " CCLD   $@"
	$(CC) $(CFLAGS) $(BIN2C_SRCS) -o $@ $(LDFLAGS)

clean: bin2c_clean
bin2c_clean:
	$(RM) $(BIN2C)
