	.file	"lab5_prob3_1.c"	# for debugging
	.section	.rodata			# new section, read only data
.LC0:
	.string	"Hello, world"		# our string to print in the main function
	.text						# declares the follwing code goes into the default section of the executable
	.globl	main				# main is a global label, allowing the entire program to see it
	.type	main, @function 	# define main as a function, the executable code
main:
.LFB0:							# local label, refers to the function start (main, in this case)
	.cfi_startproc				# start this process
	pushq	%rbp				# 1. save the value of rbp to the stack, rbp points to the base of our stack
	.cfi_def_cfa_offset 16		# debugging
	.cfi_offset 6, -16			# debugging
	movq	%rsp, %rbp			# 2. move rsp into rbp
	.cfi_def_cfa_register 6		# debugging
	subq	$16, %rsp			# 3. subtract 16 from rsp to grow the stack, saving space
								# These 3 commands above save space on the stack for variables
	movl	%edi, -4(%rbp)		# moves edi to the memory location rbp - 4
	movq	%rsi, -16(%rbp)		# moves rsi to the memory location rbp - 16
	movl	$.LC0, %edi			# loads our string into edi, at rbp - 4 on the stack
	call	puts				# calls the putstring function, displaying hello world onto the screen
	movl	$0, %eax			# store return value of 0 into eax, normal convention
	leave						# frees the space stored on the stack
	.cfi_def_cfa 7, 8			# debugging
	ret 						# returns to the calling procedure
	.cfi_endproc				# end the process - the actual return instruction, from here through below, freeing up stack space and giving the AOK
.LFE0:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
