section .text
global main

main:
    mov edx , 0                              ; edx = k0  (k0 = 0 ) 

mov esi , 0                               ; K zähler (Sprung zähler ) 

loop:                                        ;k = k + A [k ] 
    mov ecx , [buffer + edx ]      ; ecx = A[k] 
    add edx , ecx                         ; edx = edx + ecx  ---> k = k + A[k] 
    cmp edx , 5                     ;A[5] oder mehr als 5 gibt es als index nicht 
    jge EndeLoop 
    inc  esi                          ; else dann sprung zähler ++ 
    cmp esi , 100             ; wenn mehr als 100 sprunge sind, dann bestimmt ist ein endlose  
    je FehlerLoop          ; schleife 
    jmp loop 

;...............

EndeLoop : 

mov eax , 1 

mov ebx , esi       ;anzahl der sprunge zurück geben 

int 80h 

;..........

FehlerLoop:

mov eax , 1 

mov ebx , -1     ; gibt -1 zurück , wenn eine endlos schleife ist 

int 80h 


section.data : 

buffer db 2 ,3 ,-1 , 2 , -2
