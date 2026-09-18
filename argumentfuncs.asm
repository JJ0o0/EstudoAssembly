global _start

section .text
    _start:
        mov rdi, 60
        mov rsi, 7
        call soma

        ; Return RAX
        mov rdi, rax
        mov rax, 60
        syscall
    
    soma:
        mov rax, rdi
        add rax, rsi
        ret