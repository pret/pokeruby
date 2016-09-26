CXX := g++

CXXFLAGS := -std=c++11 -O2 -Wall -Wno-switch

SRCS := main.cpp sym_file.cpp elf.cpp

HEADERS := ramscrgen.h sym_file.h elf.h char_util.h

.PHONY: clean

ramscrgen: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@

clean:
	$(RM) ramscrgen ramscrgen.exe
