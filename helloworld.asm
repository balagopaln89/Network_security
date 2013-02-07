section .data
    message:     db 'Hello world!',0ah     ; 'Hello world!' plus a newline  character
    message_length:  equ $-msg             ; Length of the 'Hello world!' string
                                       

section .text
    global main

main:
    mov eax,4                              ; The system call for write (sys_write)
    mov ebx,1                              ; File descriptor 1 - standard output
    mov ecx,message                        ; Put the offset of msg in ecx
    mov edx,message_length                 ; Put the message length in edx
    int 80h                                ; Call the kernel

    mov eax,1                              ; The system call for exit (sys_exit)
        int 80h
