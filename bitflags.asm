global _start

section .text
    _start:
        mov al, 0b00000000
        or al, 0b00001010

        mov bl, al

        and bl, 0b00000010
        cmp bl, 0
        je zerado

        xor al, 0b00000010
        cmp al, 0
        je zerado

        ; Return 1
        mov rax, 60
        mov rdi, 1
        syscall
    
    zerado:
        ; Return 0
        mov rax, 60
        mov rdi, 0
        syscall