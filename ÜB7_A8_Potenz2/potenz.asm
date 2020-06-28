 section .text
 global main
 
 main:
    mov eax, 10      ;Definieren der Zahl
    mov ebx, 0      ;definiert Zähler für bt
    mov ecx, 0      ;Zähler ob Potenz
    
loop:
    bt eax, ebx     ;Bit vergleich
    jc zaehler
    inc ebx
    cmp ebx, 31        ;Ende vom Bit
    je exitOk
    jmp loop
    
zaehler:
    inc ebx
    inc ecx
    cmp ecx, 1      ;Vergleich, ob Potenz von 2
    je loop
    jmp exitError
    
exitError:
    mov eax, 4
    mov ebx, 1
    mov ecx, errormsg
    mov edx, errorlen
    int 80h
    jmp exit

exitOk:
    mov eax, 4
    mov ebx, 1
    mov ecx, okmsg
    mov edx, oklen
    int 80h


exit:
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    errormsg db 'Keine Potenz von 2', 0xa
    errorlen equ $-errormsg
    okmsg db 'Zahl ist eine Potenz von 2', 0xa
    oklen equ $-okmsg
