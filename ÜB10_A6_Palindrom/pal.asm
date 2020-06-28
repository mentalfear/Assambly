section .text
extern printf
global main

main:
    mov ecx, 1  ;Zähler von links
    mov edx, 0  ;Zähler von rechts
    
input:
    mov eax, 3
    mov ebx, 0
    mov ecx, sinput
    mov edx, 19
    int 80h
    
    push eax    ; länge des Strings
    mov edx, eax    ; edx = länge des Inputs
    dec edx
    mov ecx, 0
    
loop:
    mov al, [sinput + ecx]  ; Hole erste Stelle +1
    inc ecx
    mov bl, [sinput + edx]   ; Hole letzten Stell -1
    cmp edx, 1
    je exitOk
    
    dec edx
    
    
    cmp al, bl
    je loop
    
exitError:
    mov eax, 4
    mov ebx, 1
    mov ecx, outputError
    mov edx, lenoError
    int 80h
    
    jmp exit
    
    
exitOk:
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, leno
    int 80h
    
    jmp exit
    

exit:
    mov eax, 1
    mov ebx, 0
    int 80h
  
    
section .data
    sinput times 20 db 0
    inputlen equ $-sinput
    output db 'Palindrom!', 0xa, 0
    leno equ $-output
    outputError db 'kein Palindrom!', 0xa, 0
    lenoError equ $-outputError
