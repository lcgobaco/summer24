COMPILER = g++ -std=c++14 -g
ASM = as

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

counting: counting.asm
	as --gstabs -o counting.o counting.asm
	ld -o counting counting.o

muldiv: muldiv.asm
	as --gstabs -o muldiv.o muldiv.asm
	ld -o muldiv muldiv.o



clean:
	rm -f main *.o
