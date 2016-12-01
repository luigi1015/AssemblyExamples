all: HelloWorld

HelloWorld:
	nasm -f elf64 -o helloworld.o helloworld.asm
	ld -o helloworld helloworld.o

clean:
	rm helloworld *~ *.o
