section .text
extern printf
global main

main:
    mov eax, 1      ; reserviert für den Nenner
    mov ecx, 1      ; Schleifenzähler = 1

    mov [one], ecx      ;initialisierung mit 1
    fild qword [one]    ;FloatingPointStack float integer
    fstp qword [erg]    ; erg = f1.0 (init von ergebnis)
    
fakultaet:
    mul ecx     ;eax = eax * ecx
    mov [nenner], eax   ; nenner = eax (neue Falkultaet)
    inc ecx             ; Schleifenzähler++
    
bruch:
    fild qword [one]    ; push zaehler
    fild qword [nenner] ;push nenner
    fdiv                ; division
    fld qword [erg]     ; altes Ergebnis auf den floating Stack
    fadd                ; newZwischenErg + oldErg
    fstp qword [erg]    ; neues Ergebnis speichern
    cmp ecx, 10          ; Abbruchbedingung
    jge exit            
    jmp fakultaet       ; Schleifenwiederholung
    
exit:
    push dword [erg+4]      ;untere Hälfte
    push dword [erg]        ;obere Hälte
    push printFormat
    call printf
    
    mov eax, 1
    mov ebx,0
    int 80h
    
section .data
    printFormat db 'e = %E', 0xa,0
    one dq 1 
    nenner dq 1
    erg dq 1
    

    
