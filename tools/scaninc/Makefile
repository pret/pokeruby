CXX = g++

CXXFLAGS = -Wall -Werror -std=c++11 -fno-exceptions -fno-rtti -O2

SRCS = scaninc.cpp c_file.cpp asm_file.cpp formatter.cpp
OBJS = $(SRCS:.cpp=.o)

HEADERS := scaninc.h asm_file.h c_file.h formatter.h

.PHONY: all clean
.SUFFIXES:
all: scaninc
	@:

$(OBJS): %.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

scaninc: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.o
	$(RM) scaninc scaninc.exe
