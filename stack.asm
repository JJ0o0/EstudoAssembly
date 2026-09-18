global _start

section .text
    _start:
        mov rax, 10
        mov rbx, 20
        mov rcx, 30

        push rax
        push rbx
        push rcx

        pop rdx
        pop rsi
        pop rdi

        ; Return
        mov rax, 60
        syscall