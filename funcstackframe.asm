global _start

section .text
    _start:
        mov rdi, 20
        mov rsi, 22
        call calcula

        mov rdi, rax
        mov rax, 60
        syscall
    
    ; long calcula(long a, long b) {
    ;     long resultado = a + b;
    ;     return resultado * 2;
    ; }
    calcula:
        push rbp
        mov rbp, rsp

        mov rax, rdi
        add rax, rsi
        
        sub rsp, 8
        mov [rbp - 8], rax

        mov rax, [rbp - 8]
        shl rax, 1

        add rsp, 8
        pop rbp

        ret