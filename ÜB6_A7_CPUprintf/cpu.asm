section .text
    extern printf
    global main
    
main:
    mov eax, 1  ;Bumstruktur von befehlen
    cpuid
    
    push 0      ;wegen printf 0-terminiert
    shr ax, 8
    and ax, 0000000000001111b
    add ax, 48
    push ax
    ;push ecx
    ;push edx
    ;push ebx    ;ebx -> edx -> ebx
    push esp    ; zeigt auf die Stelle zum lesen
    push string
    call printf ;printf(<konstante>, pointer auf Stack-Speicher)
    
    
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
section .data
    string db 'Vondor-String ist: %s', 0xa, 0 ;wegen printf 0-terminiert
