section .text
global main

main:
eingabe:
    mov eax, 3      ;System_read
    mov ebx, 0      ; stdin
    mov ecx, input  ; var wohin geschrieben
    mov edx, 10     ; länge der var
    int 80h
    
    mov esi, 0      ; Laufvariable
    
check:
    mov al, [input+esi]   ; Hole Index-var
    cmp al, 0               ; Ende erreicht?
    je print                 ; --> Abbruchbed.
    cmp al, 90              ; Kleinbuchstabe?
    jg upper               ; Umwandlung
    add esi, 1              ; Zähler erhöhen
    jmp check               ; loop
    
upper:
    sub al, 32                  ; delta('A','a') = 32 
    mov byte [input+esi], al    ; Zurückschreiben
    add ebx, 1                  ; Zähler erhöhen
    jmp check                   ; loop
    
print:
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, inputlen
    int 80h
    
exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    

section .data
    input times 11 db 0
    inputlen equ $-input
