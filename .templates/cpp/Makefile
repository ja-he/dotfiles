# +-------------------------------+
# | A simple C++ project template |
# +-------------------------------+

# firstly: Here's your projects name. Change it to your heart's content.
PROGNAME := myproj

# Here are some compiler flags you might want to adjust.
STD := -std=c++20
OPT := -O0 -g
WRN := -Wall -Wextra -Wpedantic
LDFLAGS :=

# This automatically collects your source files in the 'src' directory and also
# generates corresponding object file names to be used as targets and
# dependencies down below.
SOURCES := $(wildcard src/*.cc)
OBJECTS := $(patsubst src/%.cc, .build/%.o, $(SOURCES))

# This creates the '.build' directory if it needs to and builds your full
# project.
all: .build $(PROGNAME)

# This builds your project.
$(PROGNAME): $(OBJECTS)
	g++ $(LDFLAGS) $(STD) $(OPT) $(WRN) $^ -o $@

# This builds all the object files in '.build' by their corresponding source
# files in 'src'.
.build/%.o: src/%.cc
	g++ $(STD) $(OPT) $(WRN) $^ -c -o $@

# This creates the '.build' directory.
.build:
	mkdir .build

# This cleans up any object files, core dumps and other cruft you might have
# created.
clean:
	rm -rf $(PROGNAME) .build/* core a.out
