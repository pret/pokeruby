CXX := g++

CXXFLAGS := -std=c++11 -O2 -Wall -Wno-switch -Werror

SRCS := agb.cpp error.cpp main.cpp midi.cpp tables.cpp
OBJS = $(SRCS:.cpp=.o)

HEADERS := agb.h error.h main.h midi.h tables.h

.PHONY: all clean
.SUFFIXES:
all: mid2agb
	@:

$(OBJS): %.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

mid2agb: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.o
	$(RM) mid2agb mid2agb.exe
