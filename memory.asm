global _start

section .text
    _start:


        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall
    
    ; escrever(long*, long)
    ; long* endereco (RDI)
    ; long valor (RSI)
    ; return void
    escrever:
        mov qword [rdi], rsi
        ret
    
    ; ler(long*)
    ; long* endereco (RDI)
    ; return long (RAX)
    ler:
        mov rax, [rdi]
        ret
    
    ; preencher(long*, long, long)
    ; long* array (RDI)
    ; long quantidade (RSI)
    ; long valor (RDX)
    ; return void
    preencher:
        cmp rsi, 0
        je fim

        mov [rdi], rdx

        add rdi, 8

        dec rsi
        jnz preencher

        ret
    
    ; copiar(void*, void*, long)
    ; void* destino (RDI)
    ; void* origem (RSI)
    ; long quantidade (RDX)
    ; return void
    copiar:
        cmp rdx, 0
        je fim

        mov al, [rsi]
        mov [rdi], al

        inc rsi
        inc rdi

        dec rdx
        jnz copiar

        ret
    
    ; trocar(long*, long*)
    ; long* a (RDI)
    ; long* b (RSI)
    ; return void
    trocar:
        mov rax, [rdi]  ; Salvei a
        mov rcx, [rsi]  ; Salvei b

        mov [rdi], rcx  ; Guardei b em a
        mov [rsi], rax  ; Guardei a em b

        ret
    
    ; sobrepoe(void*, void*, long)
    ; void* destino (RDI)
    ; void* origem (RSI)
    ; long quantidade (RDX)
    ; return int (RAX)
    sobrepoe:
        xor rax, rax

        lea r8, [rdi + rdx]
        cmp r8, rsi
        jbe fim

        lea r8, [rsi + rdx]
        cmp r8, rdi
        jbe fim

        mov rax, 1
        ret
    
    ; copiar_reverso(void*, void*, long)
    ; void* destino (RDI)
    ; void* origem (RSI)
    ; long quantidade (RDX)
    ; return void
    copiar_reverso:
        cmp rdx, 0
        je fim

        lea rdi, [rdi + rdx - 1]
        lea rsi, [rsi + rdx - 1]

    copiar_reverso_loop:
        mov al, [rsi]
        mov [rdi], al

        dec rsi
        dec rdi

        dec rdx
        jnz copiar_reverso_loop

        ret
    
    ; mover(void*, void*, long)
    ; void* destino (RDI)
    ; void* origem (RSI)
    ; long quantidade (RDX)
    ; return void
    mover:
        cmp rdx, 0
        je fim

        call sobrepoe

        cmp rax, 0
        je nao_sobrepoe

        cmp rdi, rsi
        jl nao_sobrepoe
        jg destino_maior

        ret

    nao_sobrepoe:
        call copiar
        ret

    destino_maior:
        call copiar_reverso
        ret

    fim:
        ret
