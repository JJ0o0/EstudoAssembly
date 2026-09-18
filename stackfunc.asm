global _start

section .text
    _start:
        mov rdi, 10     ; Inicializa RDI como 10
        call funcao_a   ; Chama funcao_a

        mov rdi, rax    ; Define o valor de RAX como retorno
        mov rax, 60     ; Código para o comando exit(2) no Linux
        syscall         ; Chamando exit(2)
    
    funcao_a:
        push rdi        ; Salvamos RDI na Stack

        call funcao_b   ; Chama funcao_b

        pop rdi         ; Recuperamos o topo da Stack em RDI
        mov rax, rdi    ; Setamos RAX para ser o valor de RDI
        ret             ; Retornamos para o _start
    
    funcao_b:
        mov rdi, 999    ; Setamos RDI para ser 999
        ret             ; Retornamos para funcao_a