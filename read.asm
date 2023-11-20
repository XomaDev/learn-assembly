section .data
    greet db "Type in 10 characters:", 10
    greet_len equ $- greet

    nl db 10

    ; name user input
    input_name db 10
    input_name_len equ 10

section .text
    global _start

do_print:
    mov rax, 1                      ; sys_write
    mov rdi, 1                      ; fd
    syscall
    ret

_start:
    mov rsi, greet                  ; buff
    mov rdx, greet_len              ; len
    call do_print

    ; sys_read
    mov rax, 0                      ; sys_read
    mov rdi, 1                      ; fd
    mov rsi, input_name             ; store buff
    mov rdx, input_name_len         ; buff len
    syscall

    ; loop_init
    mov rbx, 10
    count_loop:
        ; sys_write user input
        mov rsi, input_name         ; store buff
        mov rdx, input_name_len     ; buff len
        call do_print

        ; new line
        mov rsi, nl                 ; new line
        mov rdx, 1                  ; buff len
        call do_print

        sub rbx, 1                  ; subtract 1
        cmp rbx, 0                  ; check if 0
        jne count_loop              ; if not reloop

    ; reached when rbx is 0
    mov rax, 60                     ; sys_exit
    mov rdi, rbx                    ; exit code
    syscall