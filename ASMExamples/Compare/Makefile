all: HelloWorld

HelloWorld:
	nasm -f elf64 -o compare.o compare.asm
	ld -o compare compare.o

clean:
	rm compare *~ *.o
