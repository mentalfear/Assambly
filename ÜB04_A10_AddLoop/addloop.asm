section .text
global main

main:
    mov ebx, 0
    mov ecx, 10
loop:
    add ebx, ecx
    dec ecx
    jnz loop
    
    
print:
    push ebx
    mov eax, 4
    int 80h
    
