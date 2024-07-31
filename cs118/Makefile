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

subroutine: subroutine.asm
	as --gstabs --32 -o subroutine.o subroutine.asm
	ld -m elf_i386 -o subroutine.out subroutine.o

keyboard: keyboard.asm
	as --gstabs --32 -o keyboard.o keyboard.asm
	ld -m elf_i386 -o keyboard.out keyboard.o

math: math.asm
	as --gstabs --32 -o math.o math.asm
	ld -m elf_i386 -o math.out math.o


cr: cr.asm
	as --gstabs --32 -o cr.o cr.asm
	ld -m elf_i386 -o cr.out cr.o


clean:
	rm -f main *.o
