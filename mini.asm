global _start

section .bss
    numero resb 2

section .text
    _start:
        mov al, 65
        mov [rel numero], al
        lea rsi, [rel numero]
        mov cl, [rsi]

        mov byte [rel numero + 1], 10

        mov rax, 1
        mov rdi, 1        
        mov rdx, 2
        syscall

        mov rax, 60
        mov rdi, 0
        syscall