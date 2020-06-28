section .text
global main

main:
    mov eax, 0          ;Summe = 0
calc:
    add eax, [count]    ; addiere counter drauf
    
    inc byte [count]    ; erhöhe den Counter
    cmp byte [count], 10
    jle calc            ;jump if lower to calc
    
    push 0              ; für die Schleifen bedingung zum abbrechen
    push 10             ; Absatz
    
    mov ecx, 10         ; set divisor to 10
stloop:
    mov edx, 0          ; set remainder to 0, vermeidet floating                
                            ;point exception
    div ecx             ; eax:ebx -> rest steht in edx
    add edx, 48         ; ascii offset
    push edx            ; push remainder to stack
    cmp eax, 0
    je print
    jmp stloop
    
print:
    ;pop esi
    ;cmp esi, 0
    ;je exit
    ;mov [output], esi   ; 
    mov ecx, esp
    mov ebx, 1
    mov eax, 4
    mov edx, 1
    int 80h
    
    pop ecx
    cmp ecx, 10
    jne print
      
    
exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
section .data
    count db 0
    output db 0
