global _start

section .data
    ; Definindo Strings e guardando o tamanho
    maiorMsg db "EAX maior que EBX", 10
    maiorMsgLen equ $ - maiorMsg
    igualMsg db "EAX igual a EBX", 10
    igualMsgLen equ $ - igualMsg
    menorMsg db "EAX menor que EBX", 10
    menorMsgLen equ $ - menorMsg

section .text
    _start:
        ; Definindo numeros
        mov eax, -8
        mov ebx, 10

        ; Comparando
        cmp eax, ebx
        jg maior
        je igual
        jl menor

        ; Encerra o processo com status zero
        mov rax, 60
        mov rdi, 0
        syscall
    
    maior:
        ; Print
        mov rax, 1
        mov rdi, 1
        mov rsi, maiorMsg
        mov rdx, maiorMsgLen
        syscall

        ; Encerra o processo com status zero
        mov rax, 60
        mov rdi, 0
        syscall
    
    igual:
        ; Print
        mov rax, 1
        mov rdi, 1
        mov rsi, igualMsg
        mov rdx, igualMsgLen
        syscall

        ; Encerra o processo com status zero
        mov rax, 60
        mov rdi, 0
        syscall
    
    menor:
        ; Print
        mov rax, 1
        mov rdi, 1
        mov rsi, menorMsg
        mov rdx, menorMsgLen
        syscall

        ; Encerra o processo com status zero
        mov rax, 60
        mov rdi, 0
        syscall