global _start

section .text
    _start:
        call soma

        ; Return RAX
        mov rdi, rax
        mov rax, 60
        syscall
    
    soma:
        mov rax, 10
        call alguma_coisa

        add rax, 5
        ret
    
    alguma_coisa:
        mov rax, 20
        ret