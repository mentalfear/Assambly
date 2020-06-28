section .text
global main

main:
    mov byte [wort], 98
    
    mov eax, 4
    mov ebx, 0
    mov ecx, wort
    mov edx, 2
    int 80h
    
    mov eax, 1
    mov ebx, 0
    int 80h


section .data
    wort db 97, 0xa
