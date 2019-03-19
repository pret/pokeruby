CXX := g++

CXXFLAGS := -Wall -std=c++11 -O2

SRCS := json11.cpp itemsjson.cpp

HEADERS := itemsjson.h

.PHONY: all clean

all: itemsjson
	@:

itemsjson: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) itemsjson itemsjson.exe
