section .text
global main

main:
textEingabe:            ;Text das zur Eingabe auffordert
    mov eax, 4
    mov ebx, 1
    mov ecx, inputtest
    mov edx, inputlen
    int 80h

eingabe:
    mov eax, 3          ;sys_read
    mov ebx, 0          ;stdin
    mov ecx, sinput     ;Variable zum schreiben
    mov edx, 25         ;Anzahl Stellen -> 26-1
    int 80h
    
    push eax

textAusgabe:            ;Text das die ausgabe ankündigt
    mov eax, 4
    mov ebx, 1
    mov ecx, outputtest
    mov edx, outputlen
    int 80h
    
ausgabe:            
    pop esi             ;die Länge aus Stack holen
    
    mov eax, 4
    mov ebx, 1
    mov ecx, sinput
    mov edx, esi
    int 80h
    
exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    

section .data
    sinput times 26 db 0        ;26 Stellen mit 0 gefüllt
    inputtest db 'Geben Sie etwas ein', 0xa
    inputlen equ $-inputtest    ;Reihenfolge beachten
    outputtest db 'Test der eingegeben wurde:', 0xa
    outputlen equ $-outputtest
