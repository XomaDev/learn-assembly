section .data
    greet db "I hope you are well today", 10
    greet_len equ $- greet

    name db "I'm Kumaraswamy, how are you?", 10
    name_len equ $- name

section .text
    global _start

_start:
    mov rsi, greet        ; buff
    mov rdx, greet_len    ; len

    call do_print

    mov rbx, 10 ; init to 10
    mov rsi, name        ; buff
    mov rdx, name_len    ; len

    count_loop:
        call do_print

        sub rbx, 1 ; subtract 1
        cmp rbx, 0 ; check if 0
        jne count_loop ; if not reloop

        ; reached when rbx is 0
        mov rax, 60            ; sys_exit
        mov rdi, rbx           ; exit code
        syscall


do_print:
    mov rax, 1           ; sys_write
    mov rdi, 1           ; fd
    syscall
    ret