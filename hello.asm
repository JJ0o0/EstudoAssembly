; LINUX ONLY

global _start ; Torna _start visível para o linker

section .data ; Seção que contém variáveis e outros dados
    msg db "Hello World!", 10 ; String
    msgLen equ $ - msg ; Tamanho da String

section .text ; Seção que contém código executável
    _start: ; Label onde nossa execução começa
        ; Escrevendo algo no terminal
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, msgLen
        syscall

        ; Chama no kernel para finalizar o programa
        mov rax, 60
        mov rdi, 42
        syscall