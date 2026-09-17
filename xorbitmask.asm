global _start

section .text
    _start:
        mov al, 0b10110010
        xor al, 0b00000100
        xor al, 0b00000100

        ; Return
        mov rax, 60
        movzx rdi, al
        syscall