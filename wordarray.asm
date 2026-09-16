global _start

section .data
    array dq 100, 200, 300

section .text
    _start:
        lea rsi, [rel array]
        mov ebx, 3

    contador:
        mov rax, [rsi]
        add rsi, 8

        dec ebx
        jnz contador

        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall