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
	ld -o counting.out counting.o

muldiv: muldiv.asm
	as --gstabs --32 -o muldiv.o muldiv.asm
	ld -m elf_i386 -o muldiv.out muldiv.o

displays: displays.asm
	as --gstabs -o displays.o displays.asm
	ld -o displays.out displays.o


decimals: decimals.asm
	as --gstabs -o decimals.o decimals.asm
	ld -o decimals.out decimals.o



clean:
	rm -f main *.o
