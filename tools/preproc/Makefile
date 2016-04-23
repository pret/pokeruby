CXX := g++

CXXFLAGS := -std=c++14 -O2

SRCS := asm_file.cpp charmap.cpp preproc.cpp utf8.cpp

HEADERS := asm_file.h char_util.h charmap.h preproc.h utf8.h

.PHONY: clean

preproc: $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@

clean:
	$(RM) preproc preproc.exe
