ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#
TOOLS_DIR ?= ..
SCANINC_DIR := $(basename $(TOOLS_DIR)/scaninc)
SCANINC ?= $(SCANINC_DIR)/scaninc$(EXE)

CXX = g++
CXX_STANDARD := $(shell $(SHELL) $(SCANINC_DIR)/cxx_standard.sh $(CXX))
SCANINC_CXXFLAGS = -Wall -Werror -fno-exceptions -fno-rtti -O2 -I $(SCANINC_DIR)/mio/include $(CXX_STANDARD)

SCANINC_SRCS = $(addprefix $(SCANINC_DIR)/,scaninc.cpp c_file.cpp asm_file.cpp formatter.cpp)
SCANINC_OBJS = $(SCANINC_SRCS:.cpp=.o)

SCANINC_HEADERS := $(addprefix $(SCANINC_DIR)/,file.h scaninc.h asm_file.h c_file.h formatter.h)

.PHONY: scaninc_all scaninc_clean
.SUFFIXES:
scaninc_all: $(SCANINC)
	@:

$(SCANINC_OBJS): %.o: %.cpp $(SCANINC_HEADERS)
	@$(ECHO) " CXX   $@"
	$(CXX) $(SCANINC_CXXFLAGS) -c $< -o $@

$(SCANINC): $(SCANINC_OBJS)
	@$(ECHO) " CXXLD $@"
	$(CXX) $(SCANINC_CXXFLAGS) $(SCANINC_OBJS) -o $@ $(LDFLAGS)

clean: scaninc_clean
scaninc_clean:
	$(RM) $(SCANINC_OBJS)
	$(RM) $(SCANINC)
