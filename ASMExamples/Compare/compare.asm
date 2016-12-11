section .data
	correctmsg	db	"Got the right number!"
	incorrectmsg	db	"Got a wrong number!"
	NEW_LINE	db	0xa; newline character
	SYS_WRITE	equ	1; 1 is the syscall number for sys_write, aka write to the screen
	SYS_EXIT	equ	60; 60 is the syscall number for exit out of the program
	STD_OUT		equ	1; 1 is the file descriptor for standard output
	EXIT_CODE	equ	0; 0 is the exit code for no errors

	num1	equ	100; Define num1 as integer 100
	num2	equ 50; Define num2 as integer 50
	sum	equ 150; Define sum as integer 150


section .text
	global _start

_start:
	; Do the actual addition and comparison
	mov rax, num1; Set the rax register to the value of num1
	mov rbx, num2; Set the rbx register to the value of num2
	add rax, rbx; Add registers rax and rbx. Then store the sum in rax.
	cmp rax, sum; Compare the value in register rax to the value of sum.
	jne .displayincorrect; If the compare is not equal, jump to .displayincorrect procedure (which should never happen in this program, but this is an example)
	jmp .displaycorrect; Just jump to the .displaycorrect procedure. If this line runs (which it should), the compare was equal, so don't need to do another compare.

; Procedure to display the correct number message.
.displaycorrect:
	; Write what's in the first 21 bytes of correctmsg to standard out
	mov	rax, SYS_WRITE; temporary register, syscall number
	mov	rdi, STD_OUT; first argument, in this case file descriptor: 0 = standard input, 1 = standard output, 2 = standard error
	mov	rsi, correctmsg; 2nd argument pointer, in this case the text to dsiplay
	mov	rdx, 21; 3rd argument, in this case the number of bytes to be written
	syscall; execute the syscall

	; Write a newline character to standard out, same instructions as above but new character to print
	mov	rax, SYS_WRITE
	mov	rdi, STD_OUT
	mov	rsi, NEW_LINE
	mov	rdx, 1
	syscall

	jmp .exit; Jump to the exit procedure to exit the program


; Procedure to display the incorrect number message.
.displayincorrect:
		; Write what's in the first 19 bytes of incorrectmsg to standard out
		mov	rax, SYS_WRITE; temporary register, syscall number
		mov	rdi, STD_OUT; first argument, in this case file descriptor: 0 = standard input, 1 = standard output, 2 = standard error
		mov	rsi, incorrectmsg; 2nd argument pointer, in this case the text to dsiplay
		mov	rdx, 19; 3rd argument, in this case the number of bytes to be written
		syscall; execute the syscall

		; Write a newline character to standard out, same instructions as above but new character to print
		mov	rax, SYS_WRITE
		mov	rdi, STD_OUT
		mov	rsi, NEW_LINE
		mov	rdx, 1
		syscall

		jmp .exit; Jump to the exit procedure to exit the program

; exit procedure
.exit:
	mov	rax, SYS_EXIT
	mov	rdi, EXIT_CODE
	syscall
