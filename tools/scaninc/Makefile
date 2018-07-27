CXX = g++

CXXFLAGS = -Wall -Werror -std=c++14 -fno-exceptions -fno-rtti -O3 -s

SRCS = scaninc.cpp c_file.cpp asm_file.cpp formatter.cpp

HEADERS := scaninc.h asm_file.h c_file.h formatter.h

.PHONY: all clean

all: scaninc
	@:

scaninc: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) scaninc scaninc.exe
