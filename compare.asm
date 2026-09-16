global _start

section .data
    maiorMsg db "Deu maior", 10
    maiorMsgLen equ $ - maiorMsg

section .text
    _start:
        mov eax, 10
        mov ebx, 5

        cmp eax, ebx
        ja maior

        mov rax, 60
        mov rdi, 0
        syscall

    maior:
        mov rax, 1
        mov rdi, 1
        mov rsi, maiorMsg
        mov rdx, maiorMsgLen
        syscall

        mov rax, 60
        mov rdi, 0
        syscall