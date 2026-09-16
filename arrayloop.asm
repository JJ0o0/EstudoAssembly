global _start

section .data
    array db 65, 66, 67, 68, 10

section .text
    _start:
        lea rsi, [rel array]
        mov ebx, 5

    contador:
        ; Print
        mov rax, 1
        mov rdi, 1
        mov rdx, 1
        syscall

        ; Incrementa o RSI
        inc rsi

        ; Loop
        dec ebx
        jnz contador

        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall