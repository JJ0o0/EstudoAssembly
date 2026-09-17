global _start

section .text
    _start:
        mov al, 0b00100000
        shr al, 3

        ; Return
        movzx rdi, al
        mov rax, 60
        syscall