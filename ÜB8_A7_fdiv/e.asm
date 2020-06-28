 
section .text
extern printf
global main


main:
first:
    fild qword [counter]
    fild qword [counter]
    jmp sum
loop:
    mov al, [counter]
    cmp al, 2
    je sum
    
    fild dword [zaehler]    ; push zaehler

    fld dword [nenner]     ; push Nenner
    fild dword [counter]
    fmulp
    fst dword [nenner]
    fdivp                   ; fidv zaehler/nenner + pop (Ergebnis bleibt)
    
    mov al, [counter]      ; Counter erhöhen
    add al, 1
    mov [counter], al
    ;inc byte [counter]
    jmp loop
    
sum:
    mov al, [counter]  ; Countervergleich
    cmp al, 0
    je print
    
    mov al, [counter]      ; Counter vermindern
    sub al, 1
    mov [counter], al
    
    faddp
    jmp sum

print:
    fstp qword [erg]
    
    push dword [erg+4]      ;untere Hälfte
    push dword [erg]        ;obere Hälte
    push output
    call printf

exit:
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
section .data
    output db 'e = %e', 0xa, 0
    erg dq 0
    zaehler dq 1
    counter dq 5
    nenner dq 1
