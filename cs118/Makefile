COMPILER = g++ -std=c++14 -g
ASM = as

default: all

all: clean main counting muldiv display decimals print

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

display: display.asm
	as -g -o display.o display.asm
	ld -o display.out display.o

decimals: decimals.asm
	as --gstabs --32 -o decimals.o decimals.asm
	ld -m elf_i386 -o decimals.out decimals.o

print: print.asm
	as --gstabs -o print.o print.asm
	ld -o print.out print.o


clean:
	rm -f main *.o
