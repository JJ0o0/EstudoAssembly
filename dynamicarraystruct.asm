global _start

section .text
    _start:
        sub rsp, 40

        mov qword [rsp], 10
        mov qword [rsp + 8], 20
        mov qword [rsp + 16], 30
        mov qword [rsp + 24], 40
        mov qword [rsp + 32], 50

        xor rax, rax
        mov rcx, 5
        lea rdi, [rsp]
        call somaLoop

        add rsp, 40

        mov rdi, rax
        mov rax, 60
        syscall
    
    somaLoop:
        add rax, [rdi]
        add rdi, 8

        dec rcx
        jnz somaLoop

        ret