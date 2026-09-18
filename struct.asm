global _start

section .text
    _start:
        sub rsp, 32 ; Reservando espaço para struct na stack

        mov qword [rsp + 24], 60 ; Armazena o valor do peso
        lea rcx, [rsp + 24]      ; Salva o endereço de peso

        ; Struct Pessoa
        ; long idade; Offset = 0
        ; long altura; Offset = 8
        ; long* peso; Offset = 16
        ; long peso; Offset = 24
        mov rdi, rsp
        mov rsi, 17
        mov rdx, 169
        call atualizarPessoa

        ; Chamando a função de pegar peso
        mov rdi, rsp
        call getPeso

        add rsp, 32 ; Liberando espaço da struct

        ; Retornando valor do peso
        mov rdi, rax
        mov rax, 60
        syscall
    
    ; atualizarPessoa(Pessoa*, long, long, long*)
    ; Pessoa* pessoa (RDI)
    ; long idade (RSI)
    ; long altura (RDX)
    ; long* peso (RCX)
    ; Return void
    atualizarPessoa:
        mov qword [rdi], rsi
        mov qword [rdi + 8], rdx
        mov qword [rdi + 16], rcx
        ret

    ; getPeso(Pessoa*)
    ; Pessoa* pessoa (RDI)
    ; Return long (RAX)
    getPeso:
        mov rax, [rdi + 16] ; Pegando o ponteiro armazenado no campo peso
        mov rax, [rax]      ; Pegando o valor da memória do peso
        ret