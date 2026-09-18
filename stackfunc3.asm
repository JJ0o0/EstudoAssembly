global _start

section .text
    _start:
        mov rdi, 10             ; Inicializa RDI como 10
        call funcao_a           ; Chama funcao_a

        mov rdi, rax            ; Define o valor de RAX como retorno
        mov rax, 60             ; Código para o comando exit(2) no Linux
        syscall                 ; Chamando exit(2)
    
    funcao_a:
        push rbp                ; Salva o RBP atual
        mov rbp, rsp            ; Colocando RSP em RBP

        sub rsp, 8              ; Reservando 8 bytes
        mov qword [rsp], 1234   ; Definindo essa região para 1234

        mov rax, [rbp - 8]      ; Salvando essa variável local em RAX
        add rsp, 8              ; Tirando os 8 bytes reservados
        pop rbp                 ; Restaurando RBP

        ret                     ; Retornamos para o _start