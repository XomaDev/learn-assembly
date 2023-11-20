section .data
    name db "I'm Kumaraswamy, how are you?", 10
    name_len equ $- name

    int_array dd 21, 03, 2008, 7, 12
    temperature dd 24.3

section .text
    global _start

_start:
    ; add
    mov rdi, 0
    add rdi, 7
    add rdi, 3

    ; bitwise &
    and rdi, 8

    ; for sys_write
    mov rsi, name
    mov rdx, name_len

    mov rbx, 10 ; init to 10
    count_loop:
        ; sys_write
        mov rax, 1
        mov rdi, 1
        syscall

        sub rbx, 1 ; subtract 1
        cmp rbx, 0 ; check if 0
        jne count_loop ; if not reloop

    ; exit the program
    mov rax, 60         ; syscall number for sys_exit
    mov rdi, rbx        ; exit code 0
    syscall

