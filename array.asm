global _start

section .data
    array db 65, 66, 67, 68, 10

section .text
    _start:
        ; Ponteiro para Array
        lea rsi, [rel array]

        ; Guardando em registradores
        mov al, [rsi]
        mov bl, [rsi + 1]
        mov cl, [rsi + 2]
        mov dl, [rsi + 3]
        mov r8b, [rsi + 4]
        
        ; Escrevendo os bytes
        mov byte [rsi], al
        mov byte [rsi + 1], bl
        mov byte [rsi + 2], cl
        mov byte [rsi + 3], dl
        mov byte [rsi + 4], r8b

        ; Print
        mov rax, 1
        mov rdi, 1
        mov rdx, 5
        syscall

        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall
