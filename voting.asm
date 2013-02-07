;Author    :  Balagopal                                                      
;Date      :  04/02/2013                                                     
;Filename  :  voting.asm                                                      
;Program   :  Program based on age to check if a person is eligible to vote. 



extern printf
extern scanf
section .data
    message1: db "Enter your age" ,10,0
    scan: db "%d",0
    age: dd 0
    reference_age: dd 18
    message2: db "You are eligible to vote" ,10,0 
    message3: db "you are not eligible to vote" ,10,0
    

section .text
    global main
main:
    push ebp
    mov ebp,esp
    push message1
    call printf
    add esp,4
    push age
    push scan
    call scanf
    mov eax,[age]
    cmp eax,[reference_age]
    jge loop
    push message3
    call printf
    jmp done

    loop:
        push message2
        call printf
        jmp done
    
    done:
        
    mov esp,ebp
    pop ebp
    ret





