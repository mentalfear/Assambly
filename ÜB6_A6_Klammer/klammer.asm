section .text
global main

main:
eingabe:
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 25
    int 80h
    
    mov esi, 0      ;Zähler durch die Variable  
    mov ebx, 0      ;Zähler der klammern

loop:
    mov al, [input+esi]    ;Holt den Wert
    inc esi                 ;Zähler erhöhen
    
    cmp al, '('            ;Vergleich (
    je klammerAuf
    cmp al, ')'            ;Vergleich )
    je klammerZu
    cmp al, 0              ;Ende erreicht
    je testErgebnis
    jmp loop
    
klammerAuf:
    inc ebx
    jmp loop

klammerZu:
    cmp ebx, 0
    je exitError
    dec ebx
    jmp loop

testErgebnis:
    cmp ebx, 0
    je exitOk

exitError:
    mov eax, 4
    mov ebx, 1
    mov ecx, error
    mov edx, errorlen 
    int 80h
    
exitOk:

exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    
section .data
    input times 26 db 0
    error db 'Error', 0xa
    errorlen equ $-error
