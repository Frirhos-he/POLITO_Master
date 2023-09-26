.MODEL small
.STACK
.DATA

SOURCE DW 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1      
MAPP   DW 16 DUP(?)
CROSS  DW 0
      
      
.CODE
.STARTUP  

MOV CX, 16
XOR BX,BX
MOV CROSS, 0


loop:
    MOV AX, SOURCE[BX]

    CMP AH,0
    JNE stall
    
    MOV MAPP[BX],1
    ADD CROSS,AX   
    INC BX
    INC BX
    LOOP loop
    JMP exit


stall: 
    MOV MAPP[BX],0
    INC BX
    INC BX      
    LOOP loop  
    
exit:  
 
.EXIT
END

;since CROSS IS 16 BITS AND 2^16 > worst case scenario where every MAPP values is 1 and source are 2^8-1 then cannot get overflow
; worst case goes up to 2^12