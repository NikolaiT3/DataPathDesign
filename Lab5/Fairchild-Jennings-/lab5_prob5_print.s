	# This is the same as the problem 3 files with the exception that we don't have a "main,"
	# but a "print_hello." The linker checks and therefore knows that this file is going to
	# be used in the main function of another file included in the linking process. When called
	# from main, this function will execute almost exactly like it would if it had been declared
	# inside the same file, as in problem 4. Here we just have a little more "bioler plate" code
	# that allows it to exist as a seperate file
	.file	"lab5_prob5_print.c"
	.section	.rodata
.LC0:
	.string	"Hello, world"
	.text
	.globl	print_hello
	.type	print_hello, @function
print_hello:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	puts
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_hello, .-print_hello
	.ident	"GCC: (SUSE Linux) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
