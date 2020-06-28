section .text
extern printf
global main


main:
    mov ecx, 0      ; Counter jumps
    mov edx, 0       ; Array counter
    mov dl, '0'
    mov eax,  0      ; var: read number
    mov ebx, 0       ; var: number bevor (evtl nicht benötigt)
    mov esi, 1      ; array pointer
    
read:
    mov al, [array + esi]   ; first char read
    
    cmp al, 48             ; if ax < 0
     jl noNumber             ; then NoNumber
    cmp al, 57             ; ifelse ax > 9
     jg noNumber             ; then NoNUmber
    jmp Number              ; else Number
   

Number:     ; 1. neue Nummer?
    cmp dl, '0'              ; zähler bei 0?
    jne noRightNumber      ; keine neue Zahl -> noNumber
    ;-> falls neue Zahl
    inc ecx                 ; Jump-Counter increment
    cmp ecx, 10             ; Jump-Counter > 10
    je exitloop                 ; --> Exitloop
    
    mov dl, al              ; Array Counter = Array Number
    cmp dl, '0'             ; Array Number == 0 ?
    je exitloop             ; --> exitLoop
    dec dl                  ; sich selbst abziehen
    
    cmp esi, 0              ; Am Anfang des Arrays
    je readf                ; -> nur nach rechts möglich zu lesen
        
    dec esi                 ; '-' before?
    mov bl, [array + esi]   ; bl = Vorzeichen
    inc esi                 ; Rückkehr zum Urzustand
    jmp noNumber
   
   
readf:
    cmp esi, arraylen       ; drüberhinaus lesen
    je exit                 ; --> exit
    mov bl, 0               ; Sicher gehen das (evtl nicht nötig)
    inc esi                 ; forward reading
    jmp read
    
readb:
    cmp esi, 0              ; drunterhinaus lesen
    je exit                 ; --> exit
    dec esi                 ; backward reading
    jmp read
   
noRightNumber:
    dec dl                  ; Array-Counter decrement
    jmp noNumber
    
noNumber:
    cmp bl, 45             ; if (bx = '-')
    je readb                ; jmp read backward
    jmp readf               ; jmp read forward


    
exitloop: ;-1 ausgabe
    push 0                  ; 0 treminiert für printf
    push '-1'               ; push '-1'
    jmp print

exit: ;normaler Durchlauf
    push 0                  ; 0 terminerit für printf
    add ecx, 48             ; ecx-int --> ecx-ascii
    push ecx                ; push ascii
    jmp print
    
print:
    push esp                ; printf pointer Stack
    push string             ; push message
    call printf

    mov eax, 1              ; sys_exit
    mov ebx, 0              ; error_code 0
    int 80h                 ; call kernel

section .data
    array db ' 2, 3, 0, 2, -1' ,0xa
    arraylen equ $-array
    string db 'ergebnis = %s', 0xa, 0
