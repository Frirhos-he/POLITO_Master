.MODEL small     
.STACK
.DATA            

SOURCE DB 1,2,3,4,5
       DB 6,7,8,9,0
       DB 9,8,7,6,5	
       DB 4,3,2,1,0
       DB 7,7,7,7,7
       DB 3,5,7,9,0
       DB 8,7,6,5,4     
       DB 9,9,9,3,2

;range 0-7 0-4

.CODE 
.STARTUP      
        

    XOR AX,AX ;buffer
    XOR BX,BX ;result
    XOR CX,CX ;0-7
    XOR DX,DX ;0-4
    
    XOR SI,SI ;index
    XOR DI,DI

loopi:
    MOV AX,5
    MUL CL ;offset row
    ;result in AX
    ADD AX,DX ; check odd or even 
    
    MOV SI,AX ; buffer register
    AND AX,1
    JNZ oddvalue
    
evenvalue:  
    XOR AX,AX
    MOV AL,BYTE PTR SOURCE[SI]
    ADD BX,AX
    JMP continue
oddvalue:
    XOR AX,AX
    MOV AL,BYTE PTR SOURCE[SI]
    SUB BX,AX
continue:    
    INC DX
    CMP DX,4
    JLE loopi
    
    XOR DX,DX ;reset col       
    INC CX  ; row 
    CMP CX,8
    JLE loopi

.EXIT