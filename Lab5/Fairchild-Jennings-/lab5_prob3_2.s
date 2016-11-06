	.file	"lab5_prob3_2.c"			# for debugging
	.section	.rodata					# new section, read only data
.LC0:
	.string	"The value of  i is %d\n"	# our string to print in the main function
	.text								# declares the following code goes into the default section of the executable
	.globl	main						# main is a global label, allowing the entire program to see it
	.type	main, @function				# define main as a function, the executable code
main:
.LFB0:									# local label, refers to the function start (main, in this case)
	.cfi_startproc						# start this process
	pushq	%rbp						# 1. save the value of rbp to the stack, rbp points to the base of our stack
	.cfi_def_cfa_offset 16				# debugging
	.cfi_offset 6, -16					# debugging
	movq	%rsp, %rbp					# 2. move rsp into rbp
	.cfi_def_cfa_register 6				# debugging
	subq	$32, %rsp					# 3. subtract 16 from rsp to grow the stack, saving space
										# These 3 commands above save space on the stack for variables
	movl	%edi, -20(%rbp)				# moves edi to the memory location rbp - 20
	movq	%rsi, -32(%rbp)				# moves rsi to the memory location rbp - 32		
	movl	$1, -4(%rbp)				# load 1 onto the stack at rbp - 4	"(int i = 1);"
	addl	$1, -4(%rbp)				# add 1 to the variable at rbp - 4	"i++;"
	movl	-4(%rbp), %eax				# take the variable at rbp - 4 (int i) and store it in eax for use here soon
	movl	%eax, %esi					# move int i to esi
	movl	$.LC0, %edi					# loads our string into edi, at rbp - 20 on the stack for use to print
	movl	$0, %eax					# put a return of 0 into eax saying this function executed correctly, before we switch to the printf function
	call	printf						# print int i to the screen with the function printf
	movl	$0, %eax					# store a return value of 0 in eax, per normal convention, saying main and all its called functions executed correctly
	leave								# frees the space stored on the stack
	.cfi_def_cfa 7, 8					# debugging
	ret 								# returns to the calling procedure
	.cfi_endproc						# end the process - the actual return instruction, from here through below, freeing up stack space and giving the AOK
.LFE0:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
