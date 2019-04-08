CXX := g++

CXXFLAGS := -Wall -std=c++11 -O2

SRCS := json11.cpp mapjson.cpp itemsjson.cpp main.cpp

HEADERS := itemsjson.h mapjson.h global.h

.PHONY: all clean

all: json2s
	@:

json2s: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) json2s json2s.exe
