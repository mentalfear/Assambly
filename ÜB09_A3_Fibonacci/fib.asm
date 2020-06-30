section .text
extern printf
global main

main:
        mov eax, 5       ;Def von n (Bis zu welcher Zahl)
        ;mov esi, 1      ; Startvariable
        
        push 0          ; Fib(0)
        push 1          ; Fib(1) - Startbedingung (1. Durchlauf)
        dec eax      ; Da erster durchlauf schon geschrieben
        
loop:
        pop ebx         ; n-1 
        pop ecx         ; n-2
        push ecx
        add ecx, ebx
        push ebx
        push ecx
        
        dec eax         ; dec Zähler
        cmp eax, 0
        je exit
        jmp loop
        
        
exit:   
        ;push esp
        push ausgabe
        call printf
        
        mov eax, 1
        mov ebx, 0
        int 80h
        
        
section .data
    ausgabe db 'Das Ergebnis ist %d %d %d %d %d ' , 0xa, 0 
