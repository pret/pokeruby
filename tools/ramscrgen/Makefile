CXX := g++

CXXFLAGS := -std=c++11 -O2 -Wall -Wno-switch -Werror

SRCS := main.cpp sym_file.cpp elf.cpp
OBJS = $(SRCS:.cpp=.o)
HEADERS := ramscrgen.h sym_file.h elf.h char_util.h

.PHONY: all clean
.SUFFIXES:
all: ramscrgen
	@:

$(OBJS): %.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

ramscrgen: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.o
	$(RM) ramscrgen ramscrgen.exe
