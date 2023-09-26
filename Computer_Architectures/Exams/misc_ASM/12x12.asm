
.MODEL small
.STACK
.DATA

SOURCE DB 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,
RESULT DW 0
; 11 bit should be enough considering worst case -> (2^8-1)*12 = 2^10*3-2^2*3 == 2^11
.CODE
.STARTUP


MOV CX, 12
XOR BX,BX
MOV RESULT, 0

loopi:
   
    MOV AX,12     ;;A = 12
    MUL BL        ; A = 12*i   i = column
    ADD AL,BL     ; A = A+j    j= row
    
    XOR DX,DX
    MOV SI,AX     ; SI = index A
    MOV DL, SOURCE[SI]  
    
    XOR AX,AX 
    MOV AX,BX
    MUL BL        ; A = i*j*c
    MUL DL        ; DL = c
    ADD RESULT,AX       
    
    INC BL
    LOOP loopi

.EXIT
END