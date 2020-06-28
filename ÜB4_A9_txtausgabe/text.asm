section .text
global main

main:
    mov eax, 10
    

loop:
    push eax
    mov eax, 4
    mov ebx, 1
    mov ecx, mymsg
    mov edx, mylen
    int 80h
    
    pop eax
    dec eax
    cmp eax, 0
    jnz loop
    
return:
    mov eax, 1
    mov ebx, 0
    int 80h;


section .data
    count db 10
    mymsg db 'Hello World!', 0xa
    mylen equ $-mymsg
