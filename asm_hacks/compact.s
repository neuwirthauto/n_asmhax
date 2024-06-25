	.file	"compact.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"Error opening files."
	.align 8
.LC3:
	.string	"Compact code generated successfully."
	.text
	.globl	compact_code
	.type	compact_code, @function
compact_code:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L2
	cmpq	$0, -8(%rbp)
	jne	.L3
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movb	$0, -26(%rbp)
	jmp	.L4
.L12:
	cmpl	$0, -24(%rbp)
	je	.L5
	cmpb	$10, -25(%rbp)
	jne	.L6
	movl	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	jmp	.L6
.L5:
	cmpl	$0, -20(%rbp)
	je	.L7
	cmpb	$42, -26(%rbp)
	jne	.L6
	cmpb	$47, -25(%rbp)
	jne	.L6
	movl	$0, -20(%rbp)
	jmp	.L6
.L7:
	cmpb	$47, -26(%rbp)
	jne	.L8
	cmpb	$42, -25(%rbp)
	jne	.L8
	movl	$1, -20(%rbp)
	jmp	.L6
.L8:
	cmpb	$47, -26(%rbp)
	jne	.L9
	cmpb	$47, -25(%rbp)
	je	.L10
.L9:
	cmpb	$35, -25(%rbp)
	jne	.L11
.L10:
	movl	$1, -24(%rbp)
	jmp	.L6
.L11:
	cmpl	$0, -24(%rbp)
	jne	.L6
	cmpl	$0, -20(%rbp)
	jne	.L6
	cmpb	$32, -25(%rbp)
	je	.L6
	cmpb	$9, -25(%rbp)
	je	.L6
	cmpb	$10, -25(%rbp)
	je	.L6
	movsbl	-25(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
.L6:
	movzbl	-25(%rbp), %eax
	movb	%al, -26(%rbp)
.L4:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -25(%rbp)
	cmpb	$-1, -25(%rbp)
	jne	.L12
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	compact_code, .-compact_code
	.section	.rodata
	.align 8
.LC4:
	.string	"Usage: %s <input_file> <output_file>\n"
.LC5:
	.string	".c"
.LC6:
	.string	".cpp"
.LC7:
	.string	".py"
.LC8:
	.string	".rust"
.LC9:
	.string	".asm"
.LC10:
	.string	"Unsupported file extension."
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -84(%rbp)
	je	.L14
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L22
.L14:
	leaq	.LC5(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC8(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L16
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L22
.L16:
	movl	$0, -68(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L17
.L20:
	movq	-64(%rbp), %rax
	movq	-48(%rbp,%rax,8), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	movl	$1, -68(%rbp)
	jmp	.L19
.L18:
	addq	$1, -64(%rbp)
.L17:
	cmpq	$4, -64(%rbp)
	jbe	.L20
.L19:
	cmpl	$0, -68(%rbp)
	jne	.L21
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L22
.L21:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	compact_code
	movl	$0, %eax
.L22:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
