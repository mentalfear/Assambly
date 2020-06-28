section .text
extern printf
global main

main:
    ;fld1
    mov eax, 1
    mov [counter], eax
    fild qword [counter]
    mov eax, 10
    mov [y], eax
    fild qword [y]
    
    ;fdiv
    ;fild qword [y]
    ;fadd 
    fstp qword [x]
    
    
    
    push dword [x+4]
    push dword [x]

    push output
    call printf
    ;add esp, 8
    
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
section .data
    output db 'Ergebnis ist %e', 0xa, 0
    y dq 1
    counter dq 1
    
section .bss
    x resq 1
    ;y resq 1
    z resq 1
    ;counter resq 1
    
