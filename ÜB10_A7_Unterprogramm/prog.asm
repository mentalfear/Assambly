section .text
extern printf
global main

main:
;     push 0
    push word [A]
    push word [B]
    push word [C]
    jmp print
    call subroutine
    
subroutine:
    mov bp,sp
    mov ax, [BP+6]
    add ax, [BP+4]
    sub ax, [BP+2]
    ret
    
print:
    ;mov word [RESULT] , ax
    mov eax, tee
    push eax
    push ausgabe
    call printf
    
exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    


section .data
    tee db '5'
    A dw 5
    B dw 4
    C dw 6
    RESULT dw 0
    ausgabe dd 'Stack Speicher: %s %d %d', 0xa, 0
