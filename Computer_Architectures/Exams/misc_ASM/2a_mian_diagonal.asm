.model small
.stack
.data  
matrix db 'B','D','E','G','C','A','F','I','D','M','N','O','P','Q','R','A' 
n db 4
i db 0
m db 5   
counter db 0
.startup
 
; if you find 2 'A' in main diagonal then return 1 else 0

; main diagonal is i(n+1)  
 
loop1: 
    cmp i,4
    je notfound 
    mov ax,0
    mov bx,0
    mov al,i
    mov bl,m ;(n+1)
    mul bl; (n+1)i 
    mov bx,0
    mov bx,ax
    mov al,matrix[bx]    ; al=[(n+1)i]   
    inc i
    cmp al,'A'
    jne loop1
    inc counter ;counter++
    cmp counter,2 ;find second A
    jne loop1   
    
    mov al,1; second A found in main diagonal
    jmp endpr
    
notfound: mov al,0

endpr: 
.exit

end



