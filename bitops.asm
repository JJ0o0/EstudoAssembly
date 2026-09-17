global _start

section .text
    _start:
        mov al, 0b1010
        mov bl, 0b1100

        and al, bl

        ; Return 0
        mov rax, 60
        movzx rdi, al
        syscall