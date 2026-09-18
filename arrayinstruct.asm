global _start

section .text
    _start:
        sub rsp, 40

        mov qword [rsp], 18
        mov qword [rsp + 8], 70
        mov qword [rsp + 16], 80
        mov qword [rsp + 24], 95
        mov qword [rsp + 32], 60

        mov rdi, rsp
        mov rsi, 3
        call pegarNota

        mov rdi, rax
        mov rax, 60
        syscall
    
    ; pegarNota(Pessoa*, long)
    ; Pessoa* pessoa (RDI)
    ; long indice (RSI)
    ; Return long (RAX)
    pegarNota:
        mov rax, [rdi + 8 + rsi * 8]
        ret
