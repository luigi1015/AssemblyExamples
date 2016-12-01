section .data
	msg	db	"hello, world!"
	NEW_LINE	db	0xa; newline character
	SYS_WRITE	equ	1; 1 is the syscall number for sys_write, aka write to the screen
	SYS_EXIT	equ	60; 60 is the syscall number for exit out of the program
	STD_OUT		equ	1; 1 is the file descriptor for standard output
	EXIT_CODE	equ	0; 0 is the exit code for no errors
	

section .text
	global _start

_start:
	; Write what's in the first 13 bytes of msg to standard out
	mov	rax, SYS_WRITE; temporary register, syscall number
	mov	rdi, STD_OUT; first argument, in this case file descriptor: 0 = standard input, 1 = standard output, 2 = standard error
	mov	rsi, msg; 2nd argument pointer, in this case the text to dsiplay
	mov	rdx, 13; 3rd argument, in this case the number of bytes to be written
	syscall; execute the syscall

	; Write a newline character to standard out, same instructions as above but new character to print
	mov	rax, SYS_WRITE
	mov	rdi, STD_OUT
	mov	rsi, NEW_LINE
	mov	rdx, 1
	syscall

	; exit
	mov	rax, SYS_EXIT
	mov	rdi, EXIT_CODE
	syscall
