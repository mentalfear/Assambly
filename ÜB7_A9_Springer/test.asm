section .text
    extern printf
    global main
    
main:
    mov eax, 1  ;Bumstruktur von befehlen
    cpuid
    
    push 0      ;wegen printf 0-terminiert
    
    mov bl, [vari]
    cmp bl, '0'             ; if ax < 0
     jl exit             ; then NoNumber
    cmp bl, '9'             ; ifelse ax > 9
     jg exit             ; then NoNUmber
;     jmp Number              ; else Number
    push bx

    push esp    ; zeigt auf die Stelle zum lesen
    push string
    call printf ;printf(<konstante>, pointer auf Stack-Speicher)
    
exit:    
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
section .data
    vari db ' ', 0xa
    string db 'Vondor-String ist: %s', 0xa, 0 ;wegen printf 0-terminiert
