ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#
TOOLS_DIR ?= ..
RAMSCRGEN_DIR := $(basename $(TOOLS_DIR)/ramscrgen)
RAMSCRGEN ?= ramscrgen$(EXE)
CXX := g++

CXXFLAGS := -std=c++11 -O2 -Wall -Wno-switch -Werror

RAMSCRGEN_SRCS := $(addprefix $(RAMSCRGEN_DIR)/,main.cpp sym_file.cpp elf.cpp)
RAMSCRGEN_OBJS = $(RAMSCRGEN_SRCS:.cpp=.o)
RAMSCRGEN_HEADERS := $(addprefix $(RAMSCRGEN_DIR)/,ramscrgen.h sym_file.h elf.h char_util.h)

.PHONY: ramscrgen_all clean ramscrgen_clean


ramscrgen_all: $(RAMSCRGEN)
$(RAMSCRGEN): $(RAMSCRGEN_OBJS)
	@$(ECHO) " CXXLD  $@"
	$(CXX) $(CXXFLAGS) $(RAMSCRGEN_OBJS) -s -o $@ $(LDFLAGS)

$(RAMSCRGEN_OBJS): %.o: %.cpp $(RAMSCRGEN_HEADERS)
	@$(ECHO) " CXX    $@"
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean: ramscrgen_clean
ramscrgen_clean:
	$(RM) $(RAMSCRGEN_OBJS) $(RAMSCRGEN)
