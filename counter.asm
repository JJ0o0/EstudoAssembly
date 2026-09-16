global _start

section .bss
    numero resb 2

section .text
    _start:
        ; Definindo EBX para 5
        mov ebx, 5
    
    contador:
        ; Copiando EBX para EAX
        mov eax, ebx

        ; Adicionando 48 para transformar em ASCII
        add eax, 48

        ; Guarda o numero na memória
        mov [numero], al
        mov byte [numero + 1], 10

        ; Write
        mov rax, 1
        mov rdi, 1
        mov rsi, numero
        mov rdx, 2
        syscall

        dec ebx ; Diminuindo 1 de EBX

        ; Salta se ZF for igual a 0
        jnz contador

        ; Encerra o processo com status zero se passar do JNZ
        mov rax, 60
        mov rdi, 0
        syscall