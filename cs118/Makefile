COMPILER = g++ -std=c++14 -g

default: main

all: clean main

main: project3.o
	$(COMPILER) -o $@ $^

project1.o: project1.cpp
	$(COMPILER) -c $<

project2.o: project2.cpp
	$(COMPILER) -c $<

project3.o: project3.cpp
	$(COMPILER) -c $<

clean:
	rm -f main *.o