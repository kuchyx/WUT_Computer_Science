CC=gcc
ASMBIN=nasm

all : asm cc link
asm :
	$(ASMBIN) -o asm_part.o -f elf -l asm_part.lst asm_part.asm
cc :
	$(CC) -m32 -c -g  -O0 puzzle.c -no-pie 
link :
	$(CC) -m32 -o puzzle_test.out puzzle.o asm_part.o -no-pie
clean :
	rm *.o
	rm setcol_test
	rm asm_part.lst
