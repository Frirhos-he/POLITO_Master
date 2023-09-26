; answer:
;  CROSS MAX value is on 16 thus since unsigned
;  2^16-1= 65535
;  considering the worst case of each DB of source with max value
;  2^8-1= 255 -> 255*(4*4)= 4080 thus we are sure it cannot get value on overflow
 



.MODEL small
.STACK
.DATA

SOURCE DW 10, 20 ,100 ,10000
       DW 0, 7000, 1, 2
       DW 9000, 12345, 999, 30000
       DW 200, 210, 7, 65000   
       
MAPP   DB 16 DUP(?)
CROSS  DW 0



.CODE
.STARTUP


XOR AX,AX ;buffer
XOR BX,BX ;value source
XOR CX,CX
XOR DX,DX

XOR SI,SI ;SOURCE
XOR DI,DI ;MAPP
                  
loop1:           
       
    MOV AX, SOURCE[SI]
    MOV BX,AX
    AND AX,0xFF
    
    CMP AX,BX
    JE  MAP1  
    ; represtable in 8 bits
    MOV MAPP[DI],0
    ; not
    JMP continue 

MAP1:
    MOV MAPP[DI],1
    ADD CROSS, BX
    
continue:
            
    
    ADD SI,2
    INC DI
    CMP SI,32
    JL loop1




.EXIT