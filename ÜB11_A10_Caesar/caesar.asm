; Code funktioniert nur mit kleinbuchstaben
; Offset nciht größer 5

section .text
extern printf
global main

main:
    
eingabe:
    mov eax, 3  
    mov ebx, 0
    mov ecx, input
    mov edx, 63
    int 80h
    
    push eax            ; Länge der Eingabe
        
    mov dl, byte [offset]  ; Offset Shift
    mov esi, 0          ; Loop-Zähler
    
loop:
    mov dh, byte [input+esi]    ; Hole Variable
    cmp dh, 0                   ; Abbruch Bedingung
    je ausgabe
    
    add dh, dl                  ; Add Offset
    cmp dh, 122                 ; über 'z'?
    jg jumpa
    mov byte [input+esi], dh      ; save variable
    inc esi                     ; Zähler++
    ;push edx;Test
    jmp loop                    ; jmp to loop
    
jumpa:
    sub dh, 28                  ; return to 'a'
    mov byte [input+esi], dh      ; save variable
    jmp loop                    ; jmp to loop
    
ausgabe:
    push input          ;Ausgabe mit printf
    push edx
    push msg
    call printf
    
;      mov eax, 4           ; Ausgabe
;      mov ebx, 1
;      mov ecx, input
;      pop edx
;      int 80hd
    
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    msg db 'Offset: %d , Verschlüsselt: %s' ,0xa,0 
    input times 32 db 0
    inputlen equ $-input
    offset db 6
