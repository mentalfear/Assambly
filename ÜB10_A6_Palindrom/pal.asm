section .text
extern printf
global main

main:
   
     ;Lösung Markus
    ;eax enthält text länge
    ;ecx erste Adresse des textes
    ;ebx ist der index von unten
    
input:
    mov eax, 3
    mov ebx, 0
    mov ecx, sinput
    mov edx, 64
    int 80h
    
    dec eax ; letzte 0 Zeichen
    dec eax ; enter Zeichen noch mit drin
   
    mov ebx, 0

    
    
loop:
    mov dl, [ecx + ebx]  ; Hole erste Stelle +1 
    mov dh, [ecx + eax]   ; Hole letzten Stelle -1
       
    cmp dh, dl      ;Vergleicht die Stellen
    jne exitError   ; wenn nciht gleich -> kein Palindrom
    
    cmp ebx, eax    ; Abbruch Bedingung: Zähler von unten >= Zähler von oben
    jge exitOk
    
    dec eax         ; Zähler von oben --
    inc ebx         ; Zähler von unten ++
    
    jmp loop
    
    
exitOk:
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, leno
    int 80h
    jmp exit
    
    
exitError:
    mov eax, 4
    mov ebx, 1
    mov ecx, outputError
    mov edx, lenoError
    int 80h
    jmp exit
    

exit:
    mov eax, 1
    mov ebx, 0
    int 80h
  
    
section .data
    sinput times 64 db 0    ;Input Variable
    inputlen equ $-sinput
    
    output db 'Palindrom!', 0xa, 0  ;Palindrom outputText
    leno equ $-output
    
    outputError db 'kein Palindrom!', 0xa, 0 ;kein Palindrom outputText
    lenoError equ $-outputError
    
    
   
