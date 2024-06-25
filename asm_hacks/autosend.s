	.file	"autosend.c"
	.text
	.section	.rodata
.LC0:
	.string	"%Y-%m-%d %H:%M:%S"
	.text
	.globl	get_current_time
	.type	get_current_time, @function
get_current_time:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$20, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	localtime@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC0(%rip), %rdx
	movl	$20, %esi
	movq	%rax, %rdi
	call	strftime@PLT
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_current_time, .-get_current_time
	.section	.rodata
.LC1:
	.string	"a"
.LC2:
	.string	"logs.txt"
.LC3:
	.string	"Error opening log file"
.LC4:
	.string	"[%s] %s\n"
	.text
	.globl	log_message
	.type	log_message, @function
log_message:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L5:
	movl	$0, %eax
	call	get_current_time
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	log_message, .-log_message
	.section	.rodata
.LC5:
	.string	"r"
.LC6:
	.string	"repos.txt"
.LC7:
	.string	"config.txt"
.LC8:
	.string	"Error opening file"
.LC9:
	.string	"\n"
.LC10:
	.string	"%*s\n%d"
	.align 8
.LC11:
	.string	"Error reading configuration file"
.LC12:
	.string	"Program Started at %s"
.LC13:
	.string	"Program is Active"
.LC14:
	.string	"Error opening repository: %s\n"
.LC15:
	.string	"Error getting status: %s\n"
.LC16:
	.string	"Error getting index: %s\n"
.LC17:
	.string	"Error adding to index: %s\n"
.LC18:
	.string	"Error writing index: %s\n"
.LC19:
	.string	"Error writing tree: %s\n"
.LC20:
	.string	"Error looking up tree: %s\n"
.LC21:
	.string	"auto@commit.com"
.LC22:
	.string	"Auto Commit"
.LC23:
	.string	"HEAD"
.LC24:
	.string	"Error creating commit: %s\n"
.LC25:
	.string	"origin"
.LC26:
	.string	"Error looking up remote: %s\n"
.LC27:
	.string	"Error pushing to remote: %s\n"
.LC28:
	.string	"Changes pushed for %s\n"
.LC29:
	.string	"Changes pushed for %s at %s"
	.align 8
.LC30:
	.string	"./compact %s formatted_output.c"
.LC31:
	.string	"Error formatting code for %s"
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
	subq	$104464, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -104392(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -104384(%rbp)
	cmpq	$0, -104392(%rbp)
	je	.L7
	cmpq	$0, -104384(%rbp)
	jne	.L8
.L7:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L31
.L8:
	movl	$0, -104456(%rbp)
	jmp	.L10
.L11:
	movzbl	-1040(%rbp), %eax
	cmpb	$35, %al
	je	.L10
	leaq	-1040(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	movb	$0, -1040(%rbp,%rax)
	movl	-104456(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -104456(%rbp)
	leaq	-103968(%rbp), %rdx
	cltq
	salq	$10, %rax
	addq	%rax, %rdx
	leaq	-1040(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
.L10:
	movq	-104392(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L11
	movq	-104392(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-104460(%rbp), %rdx
	movq	-104384(%rbp), %rax
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$1, %eax
	je	.L12
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movq	-104384(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L31
.L12:
	movq	-104384(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	call	get_current_time
	movq	%rax, %rdx
	leaq	-1568(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC12(%rip), %rdx
	movl	$100, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-1568(%rbp), %rax
	movq	%rax, %rdi
	call	log_message
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L30:
	movl	-104460(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	movl	$0, -104452(%rbp)
	jmp	.L13
.L29:
	call	git_libgit2_init@PLT
	movq	$0, -104440(%rbp)
	leaq	-103968(%rbp), %rax
	movl	-104452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rax, %rdx
	leaq	-104440(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	git_repository_open@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L14
	call	git_error_last@PLT
	movq	%rax, -104296(%rbp)
	movq	-104296(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104296(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	jmp	.L28
.L14:
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -104288(%rbp)
	movaps	%xmm0, -104272(%rbp)
	movaps	%xmm0, -104256(%rbp)
	movl	$1, -104288(%rbp)
	movq	-104440(%rbp), %rcx
	leaq	-104288(%rbp), %rdx
	leaq	-104432(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	git_status_list_new@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L16
	call	git_error_last@PLT
	movq	%rax, -104304(%rbp)
	movq	-104304(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L16:
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_entrycount@PLT
	testq	%rax, %rax
	je	.L17
	movq	-104440(%rbp), %rdx
	leaq	-104424(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	git_repository_index@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L18
	call	git_error_last@PLT
	movq	%rax, -104312(%rbp)
	movq	-104312(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104312(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L18:
	movq	-104424(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	git_index_add_all@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L20
	call	git_error_last@PLT
	movq	%rax, -104320(%rbp)
	movq	-104320(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104320(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L20:
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_write@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L21
	call	git_error_last@PLT
	movq	%rax, -104328(%rbp)
	movq	-104328(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104328(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L21:
	movq	-104424(%rbp), %rdx
	leaq	-104032(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	git_index_write_tree@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L22
	call	git_error_last@PLT
	movq	%rax, -104336(%rbp)
	movq	-104336(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104336(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L22:
	movq	-104440(%rbp), %rcx
	leaq	-104032(%rbp), %rdx
	leaq	-104416(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	git_tree_lookup@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L23
	call	git_error_last@PLT
	movq	%rax, -104344(%rbp)
	movq	-104344(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104344(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L23:
	leaq	-104408(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	git_signature_now@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, -104376(%rbp)
	movq	-104416(%rbp), %rcx
	movq	-104408(%rbp), %rdi
	movq	-104408(%rbp), %rdx
	movq	-104440(%rbp), %rsi
	leaq	-104000(%rbp), %rax
	pushq	$0
	pushq	$0
	pushq	%rcx
	pushq	-104376(%rbp)
	movl	$0, %r9d
	movq	%rdi, %r8
	movq	%rdx, %rcx
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	git_commit_create_v@PLT
	addq	$32, %rsp
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L24
	call	git_error_last@PLT
	movq	%rax, -104352(%rbp)
	movq	-104352(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104352(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104408(%rbp), %rax
	movq	%rax, %rdi
	call	git_signature_free@PLT
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L24:
	movq	-104440(%rbp), %rcx
	leaq	-104400(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	git_remote_lookup@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L25
	call	git_error_last@PLT
	movq	%rax, -104360(%rbp)
	movq	-104360(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC26(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104360(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
	movq	-104408(%rbp), %rax
	movq	%rax, %rdi
	call	git_signature_free@PLT
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	jmp	.L28
.L25:
	leaq	-104240(%rbp), %rdx
	movl	$0, %eax
	movl	$26, %ecx
	movq	%rdx, %rdi
	rep stosq
	movl	$1, -104240(%rbp)
	movl	$1, -104236(%rbp)
	movl	$1, -104232(%rbp)
	movl	$1, -104112(%rbp)
	movq	-104400(%rbp), %rax
	leaq	-104240(%rbp), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	git_remote_push@PLT
	movl	%eax, -104448(%rbp)
	cmpl	$0, -104448(%rbp)
	jns	.L26
	call	git_error_last@PLT
	movq	%rax, -104368(%rbp)
	movq	-104368(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC27(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-104368(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	log_message
.L26:
	leaq	-103968(%rbp), %rax
	movl	-104452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	get_current_time
	movq	%rax, %rcx
	leaq	-103968(%rbp), %rax
	movl	-104452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rax, %rdx
	leaq	-1456(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC29(%rip), %rdx
	movl	$200, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-1456(%rbp), %rax
	movq	%rax, %rdi
	call	log_message
	leaq	-103968(%rbp), %rax
	movl	-104452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rax, %rdx
	leaq	-1248(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC30(%rip), %rdx
	movl	$200, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-1248(%rbp), %rax
	movq	%rax, %rdi
	call	system@PLT
	movl	%eax, -104444(%rbp)
	cmpl	$0, -104444(%rbp)
	je	.L27
	leaq	-103968(%rbp), %rax
	movl	-104452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rax, %rdx
	leaq	-1456(%rbp), %rax
	movq	%rdx, %rcx
	leaq	.LC31(%rip), %rdx
	movl	$200, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-1456(%rbp), %rax
	movq	%rax, %rdi
	call	log_message
.L27:
	movq	-104408(%rbp), %rax
	movq	%rax, %rdi
	call	git_signature_free@PLT
	movq	-104424(%rbp), %rax
	movq	%rax, %rdi
	call	git_index_free@PLT
	movq	-104416(%rbp), %rax
	movq	%rax, %rdi
	call	git_tree_free@PLT
	movq	-104400(%rbp), %rax
	movq	%rax, %rdi
	call	git_remote_free@PLT
.L17:
	movq	-104432(%rbp), %rax
	movq	%rax, %rdi
	call	git_status_list_free@PLT
	movq	-104440(%rbp), %rax
	movq	%rax, %rdi
	call	git_repository_free@PLT
	call	git_libgit2_shutdown@PLT
.L28:
	addl	$1, -104452(%rbp)
.L13:
	movl	-104452(%rbp), %eax
	cmpl	-104456(%rbp), %eax
	jl	.L29
	jmp	.L30
.L31:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
