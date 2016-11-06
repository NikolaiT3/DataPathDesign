	# this file, inherently, is the same as the files from problem 3, with only one difference, which is noted below.
	# The reason for this is really a smart language design. There's really no difference in the calling of print_hello
	# from puts or printf. They're all functions of the same design, regardless of is they're user defined or library.
	# So just like problem 3, the linker knows the called function is defined in a seperate file just like a library
	# function would be. It checks that it's a valid function call of course, but treats it exactly the same
	.file	"lab5_prob5_main.c"
	.text
	.globl	main
	.type	main, @function
main:
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
	call	print_hello			# the only difference. instead of calling "puts" or "printf," we call "print_hello"
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
