global _start

section .text
    _start:
        mov al, 0b10110110
        and al, 0b00000100

        cmp al, 0
        je igual

        ; Return 1
        mov rax, 60
        mov rdi, 1
        syscall
    
    igual:
        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall