	.file	"beautify.c"
	.text
	.globl	add_indent
	.type	add_indent, @function
add_indent:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	addl	$1, -4(%rbp)
.L2:
	movl	-28(%rbp), %eax
	sall	$2, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	add_indent, .-add_indent
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"Error opening files."
	.align 8
.LC3:
	.string	"Formatted code generated successfully."
	.text
	.globl	format_code
	.type	format_code, @function
format_code:
.LFB7:
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
	je	.L5
	cmpq	$0, -8(%rbp)
	jne	.L6
.L5:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L6:
	movl	$0, -28(%rbp)
	movb	$0, -30(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L7
.L18:
	cmpb	$34, -29(%rbp)
	jne	.L8
	cmpb	$92, -30(%rbp)
	je	.L8
	cmpl	$0, -20(%rbp)
	jne	.L8
	cmpl	$0, -24(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -24(%rbp)
	jmp	.L9
.L8:
	cmpb	$39, -29(%rbp)
	jne	.L9
	cmpb	$92, -30(%rbp)
	je	.L9
	cmpl	$0, -24(%rbp)
	jne	.L9
	cmpl	$0, -20(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -20(%rbp)
.L9:
	cmpl	$0, -24(%rbp)
	jne	.L10
	cmpl	$0, -20(%rbp)
	jne	.L10
	cmpb	$123, -29(%rbp)
	jne	.L11
	movsbl	-29(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	addl	$1, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	add_indent
	jmp	.L17
.L11:
	cmpb	$125, -29(%rbp)
	jne	.L13
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	subl	$1, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	add_indent
	movsbl	-29(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	jmp	.L17
.L13:
	cmpb	$59, -29(%rbp)
	jne	.L14
	movsbl	-29(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	add_indent
	jmp	.L17
.L14:
	cmpb	$10, -29(%rbp)
	je	.L7
	cmpb	$9, -29(%rbp)
	jne	.L16
	jmp	.L7
.L16:
	movsbl	-29(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	jmp	.L17
.L10:
	movsbl	-29(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
.L17:
	movzbl	-29(%rbp), %eax
	movb	%al, -30(%rbp)
.L7:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -29(%rbp)
	cmpb	$-1, -29(%rbp)
	jne	.L18
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
.LFE7:
	.size	format_code, .-format_code
	.section	.rodata
	.align 8
.LC4:
	.string	"Usage: %s <input_file> <output_file>\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$3, -4(%rbp)
	je	.L20
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L21
.L20:
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	format_code
	movl	$0, %eax
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
