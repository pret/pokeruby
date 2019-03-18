ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif


ECHO ?= \#
TOOLS_DIR ?= ..
MAPJSON_DIR := $(basename $(TOOLS_DIR)/mapjson)
MAPJSON ?= $(MAPJSON_DIR)/mapjson$(EXE)

CXX = g++
MAPJSON_CXXFLAGS = -Wall -Werror -fno-exceptions -fno-rtti -O2 -std=c++11

MAPJSON_SRCS = $(addprefix $(MAPJSON_DIR)/,mapjson.cpp json11.cpp)
MAPJSON_OBJS = $(MAPJSON_SRCS:.cpp=.o)

MAPJSON_HEADERS := $(addprefix $(MAPJSON_DIR)/,mapjson.h)

.PHONY: mapjson_all s_clean
.SUFFIXES:
mapjson_all: $(MAPJSON)
	@:

$(MAPJSON_OBJS): %.o: %.cpp $(MAPJSON_HEADERS)
	@$(ECHO) " CXX   $@"
	$(CXX) $(MAPJSON_CXXFLAGS) -c $< -o $@

$(MAPJSON): $(MAPJSON_OBJS)
	@$(ECHO) " CXXLD $@"
	$(CXX) $(MAPJSON_CXXFLAGS) $(MAPJSON_OBJS) -o $@ $(LDFLAGS)

clean: mapjson_clean
mapjson_clean:
	$(RM) $(MAPJSON_OBJS)
	$(RM) $(MAPJSON)

