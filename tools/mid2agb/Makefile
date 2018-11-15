ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

ECHO ?= \#
TOOLS_DIR ?= ..
MID2AGB_DIR := $(basename $(TOOLS_DIR)/mid2agb)
MID ?= $(MID2AGB_DIR)/mid2agb$(EXE)
CXX := g++

CXXFLAGS := -std=c++11 -O2 -s -Wall -Wno-switch -Werror

MID2AGB_SRCS := $(addprefix $(MID2AGB_DIR)/,agb.cpp error.cpp main.cpp midi.cpp tables.cpp)
MID2AGB_OBJS := $(MID2AGB_SRCS:.cpp=.o)

MID2AGB_HEADERS := $(addprefix $(MID2AGB_DIR)/,agb.h error.h main.h midi.h tables.h)

.PHONY: mid2agb_all mid2agb_clean clean

mid2agb_all: $(MID2AGB)

$(MID): $(MID2AGB_OBJS)
	@$(ECHO) " CXXLD  $@"
	$(CXX) $(CXXFLAGS) $(MID2AGB_OBJS) -o $@ $(LDFLAGS)

$(MID2AGB_OBJS): %.o: %.cpp $(MID2AGB_HEADERS)
	@$(ECHO) " CXX    $@"
	$(CXX) $(CXXFLAGS) -c $< -o $@
clean: mid2agb_clean
mid2agb_clean:
	$(RM) $(MID2AGB_OBJS) $(MID2AGB)
