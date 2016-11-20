; nasm -f elf64 bmi64Linux.asm
; ld bmi64Linux.o
; ./a.out
section .text
global _start

_start:
	cmp qword [rsp], 3 ; check argument count
	jne usage

	mov rax, weightStr
	mov rbx, [rsp + 16]
	call copyString

	mov rax, heightStr
	mov rbx, [rsp + 24]
	call copyString

	mov rsi, weightStr
	mov r11, weightBase
	mov r12, weightExp
	call parseNumber

	mov rsi, heightStr
	mov r11, heightBase
	mov r12, heightExp
	call parseNumber

; square the height
	mov rax, [heightBase]
	imul qword [heightBase]
	mov [heightBase], rax
	mov rax, [heightExp]
	add [heightExp], rax

adjustExp:
	mov rax, [weightExp]
	cmp rax, [heightExp]
	je calculateAndStore
	dec qword [weightExp]
	mov rax, [weightBase]
	mov rbx, 10
	mul rbx
	mov [weightBase], rax
	jmp adjustExp

calculateAndStoreLoop:
	dec qword [bmiExp]
	inc qword [heightExp]
	mov rdx, 0
	mov rax, [heightBase]
	mov rbx, 10
	div rbx
	mov [heightBase], rax
	mov rax, 10
	mul qword [bmiBase]
	mov [bmiBase], rax
calculateAndStore:
	mov rdx, 0
	mov rax, [weightBase]
	div qword [heightBase]
	add [bmiBase], rax
	mov [weightBase], rdx
	cmp qword [bmiExp], -2
	jg calculateAndStoreLoop
	
	mov rax, [bmiBase]
	mov rbp, rsp
doneCalc:
	xor rdx, rdx
	mov rbx, 10
	div rbx	
	push rdx
	test rax, rax
	je popAndStore
	jmp doneCalc

popAndStore:
	pop rax
	add al, '0'
	xor rbx, rbx
	mov rbx, [bmiStrLen]
	mov byte [bmiStr + rbx], al
	inc rbx
	mov [bmiStrLen], rbx
	cmp rsp, rbp
	jne popAndStore

	mov rax, 1
	mov rdi, 1
	mov rsi, yourBMIMsg
	mov rdx, yourBMIMsgLen
	syscall

printBMI:
	mov byte [bmiStr + rbx], 0x0a
	inc byte [bmiStrLen]
	mov rax, 1
	mov rdi, 1
	mov rsi, bmiStr
	mov rdx, [bmiStrLen]
	add rdx, [bmiExp]
	dec rdx
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, comma
	mov rdx, 1
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, bmiStr
	sub rsi, [bmiExp]
	mov rdx, [bmiStrLen]
	sub rdx, [bmiExp]
	syscall
	jmp adjustExpForCmp

adjustDown:
	dec qword [bmiExp]
	mov rax, [bmiBase]
	mov rbx, 10
	imul rbx
	mov [bmiBase], rax
	jmp adjustExpForCmp
adjustUp:
	inc qword [bmiExp]
	xor rdx, rdx
	mov rax, [bmiBase]
	mov rbx, 10
	idiv rbx
	mov [bmiBase], rax	
	jmp adjustExpForCmp
adjustExpForCmp:
	cmp qword [bmiExp], -2
	je printEndingMessage
	jg adjustDown
	jl adjustUp
printEndingMessage:
	cmp qword [bmiBase], 1850
	jle printUnderweight
	cmp qword [bmiBase], 2500
	jle printHealthy
	cmp qword [bmiBase], 30
	jle printOverweight
printWhale:
	mov rsi, whaleMsg
	mov rdx, whaleMsgLen
	jmp printAndExit
printOverweight:
	mov rsi, overweightMsg
	mov rdx, overweightMsgLen
	jmp printAndExit
printHealthy:
	mov rsi, healthyMsg
	mov rdx, healthyMsgLen
	jmp printAndExit
printUnderweight:
	mov rsi, underweightMsg
	mov rdx, underweightMsgLen

printAndExit:
	mov rax, 1
	mov rdi, 1
	syscall

exit:
	mov rax, 60
	mov rdi, 0
	syscall

usage:
	mov rax, 1
	mov rdi, 1
	mov rsi, usageMsg
	mov rdx, usageMsgLen
	syscall
	jmp exit

copyString:
	xor rcx, rcx
	dec rcx
copyStringLoop:
	inc rcx
	mov dl, [rbx + rcx]
	mov byte [rax + rcx], dl
	cmp byte [rbx + rcx], 0
	jne copyStringLoop
	ret

; PARSE NUMBER ----------------------------------------------------------------
; input:
;	rsi: address of string to parse
;	r11: address of base
;	r12: address of exponent
; output:
;	base in address r11
;	exponent in address r12
parseNumber:
	mov rcx, r11
	call parseInt
	add rsi, r15
	mov rcx, r12
	call parseExponent
	ret
; PARSE INT -------------------------------------------------------------------
; input:
;	rsi: address of string to parse
;	rcx: address of result
; output:
;	result in address rcx
;	r15: offset to decimal part (if any)
parseInt:
	xor rax, rax
	xor rbx, rbx
	xor r13, r13
	xor r15, r15
parseIntLoop:
	mov al, byte [rsi + rbx]
	sub al, '0'
	mov r14b, al
	mov rax, [rcx]
	mov r13, 10
	mul r13
	mov [rcx], rax 
	add [rcx], r14b
	inc rbx
	cmp byte [rsi + rbx], 0
	je parseIntAddComma
	cmp byte [rsi + rbx], '.'
	je parseIntComma
	jmp parseIntLoop
parseIntComma:
	inc rbx
	mov r15, rbx
	jmp parseIntLoop
parseIntAddComma:
	cmp r15, 0
	jne parseIntDone
	mov r15, rbx
parseIntDone:
	ret

; PARSE EXPONENT --------------------------------------------------------------
; input:
;	rsi: address of string to parse
;	rcx: address of result
; output:
;	result in address rcx
parseExponent:
	xor rbx, rbx
parseExponentLoop:
	cmp byte [rsi + rbx], 0
	je parseExponentDone
	inc rbx
	jmp parseExponentLoop
parseExponentDone:
	neg rbx
	mov [rcx], rbx
	ret

; DATA SECTION ----------------------------------------------------------------
section .data
	yourBMIMsg db 'Your BMI is: '
	yourBMIMsgLen equ $ - yourBMIMsg

	whaleMsg db 'Holy McShizzle, you', 0x27 ,'re freaking whale!', 0x0a
	whaleMsgLen equ $ - whaleMsg

	overweightMsg db 'You', 0x27, 're overweight.', 0x0a
	overweightMsgLen equ $ - overweightMsg

	healthyMsg db 'You', 0x27, 're healthy.', 0x0a
	healthyMsgLen equ $ - healthyMsg

	underweightMsg db 'You', 0x27, 're underweight.', 0x0a
	underweightMsgLen equ $ - underweightMsg

	usageMsg db 'Usage: a.out <weight [kg]> <height [m]>', 0x0a
	usageMsgLen equ $ - usageMsg

	comma	db '.'

	heightBase dq 0
	heightExp dq 0

	weightBase dq 0
	weightExp dq 0

	bmiBase dq 0
	bmiExp dq 0

	
; BSS SECTION -----------------------------------------------------------------
section .bss
	heightStr resb 10
	weightStr resb 10
	bmiStr	resb 10
	bmiStrLen resq 0
