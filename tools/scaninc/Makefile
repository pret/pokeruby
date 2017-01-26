CXX = g++

CXXFLAGS = -Wall -std=c++14 -O2

SRCS = scaninc.cpp c_file.cpp asm_file.cpp

HEADERS := scaninc.h asm_file.h c_file.h

.PHONY: clean

scaninc: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@

clean:
	$(RM) scaninc scaninc.exe
