	.file	"lab5_prob4_main.c"		# everything stays the same as problem 3's explanations, barring where exceptions are defined here
	.text
	.globl	main
	.type	main, @function
main:								# no .LC0 label is needed here, as we have no pre function variables to define
									# for main, and main can and is defined in the header section. It was only
									# defined in .LC0 in problem 3 for convenience, since we had a string to
									# initialize as well
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %eax
	call	print_hello				# here is where we deviate from problem 3
	movl	$0, %eax				# we've returned from print_hello(), and we continue the exact same as problem 3, cleaning up and returning 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"Hello, world"			# we have an .LC0 tag for print_hello, since we have variables and this function to declare
	.text
	.globl	print_hello
	.type	print_hello, @function
print_hello:
.LFB1:
	.cfi_startproc					# from here to #STOP is the same stack initializing process we see in this main function and
									# in the mains of problem 3
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6			#STOP
	movl	$.LC0, %edi				# load the .LC0 label and our string, just like in problem 3, code segment 1
	call	puts					# print the string like in problem 3
	popq	%rbp					# this is a variance. pop the base pointer in preparation for our return to main, so we call
									# the right address on ret
	.cfi_def_cfa 7, 8
	ret 							# return 
	.cfi_endproc					# clean up print_hello(), using .LFE1 to help (like .LFE0 for main)
.LFE1:
	.size	print_hello, .-print_hello
	.ident	"GCC: (SUSE Linux) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
