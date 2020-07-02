section .text
global main

main:

input:
    mov eax, 3
    mov ebx, 0
    mov ecx, sinput
    mov edx, 64
    int 80h
    ;eax enthält text länge = Index von oben
    dec eax         ; letzte 0 Zeichen
    dec eax         ; enter Zeichen noch mit drin
    mov ebx, 0      ; Index von unten

loop:
    mov dl, [ecx + ebx]   ; Hole erste Stelle +1 
    mov dh, [ecx + eax]   ; Hole letzten Stelle -1
       
    cmp dh, dl      ; Vergleicht die Stellen
    jne exitError   ; wenn nicht gleich -> kein Palindrom
    
    cmp ebx, eax    ; Abbruch Bedingung: Zähler von unten >= Zähler von oben
    jge exitOk
    
    dec eax         ; Zähler von oben --
    inc ebx         ; Zähler von unten ++
    
    jmp loop
        
exitOk:
    mov ebx, 0      ; 0 = Palindrom
    mov eax, 1
    int 80h
    
exitError:
    mov ebx, 1      ; 1 = kein Palindrom
    mov eax, 1
    int 80h
    
  
  
section .data
    sinput times 64 db 0    ;Input Variable
    inputlen equ $-sinput
    
    
   
