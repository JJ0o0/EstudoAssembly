global _start

section .text
    _start:
        mov rdi, 50     ; Inicializa RDI como 50
        call funcao_a   ; Chama funcao_a

        mov rdi, rax    ; Define o valor de RAX como retorno
        mov rax, 60     ; Código para o comando exit(2) no Linux
        syscall         ; Chamando exit(2)
    
    funcao_a:
        mov rbx, 1234   ; Setamos RBX para ser 1234

        push rbx        ; Salvamos RBX na Stack

        call funcao_b   ; Chama funcao_b

        pop rbx         ; Recuperamos o topo da Stack em RBX
        mov rax, rbx    ; Setamos RAX para ser o valor de RBX
        ret             ; Retornamos para o _start
    
    funcao_b:
        mov rbx, 9999   ; Setamos RBX para ser 999
        ret             ; Retornamos para funcao_a