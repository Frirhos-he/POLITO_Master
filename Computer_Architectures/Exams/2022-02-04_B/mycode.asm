.model small  
.stack
.data

SOURCE dw -10,-20,-100,-10000,-1,-12000,-3,-2,-9000,-12345,-999,-30000,-126,-19999,-1,-32000
MAPP db 16 dup(?)
CROSS dw 0
.startup
                                
;8 bit unsigned   0...255   
;8 bit signed   -128...0...127
;16 bit unsigned 0...65536
;16 bit signed -32768...0..32768
MOV BX,0
mov si,0  ; FOR SOURCE
mov di,0  ;FOR MAPP    
;8 bit signed   -128...0...127  

LOOP1:  CMP SI,32        ; CHECK IF ALL SOURCE ELEMENTS ARE LOADED
        JE  ENDPR
        mov ax,SOURCE[SI]      
        CMP AX, -128
        JL SET0  ; CAN NOT FIT SO SET 0 IN MAPP
        CMP AX,0
        JG  SET0  ; CAN NOT FIT SO SET 0 IN MAPP

SET1: MOV BL,-1         ; CAN FIT IN 8 BIT
      MOV MAPP[DI],BL    ; SET -1 TO MAPP
      ADD CROSS,AX       ;ADD ELEMENTS OF SOURCE THAT FEET IN CROSS
      
NEXT: INC DI             ; SET COINTERS FOR NEXT ITERATIONS
      ADD SI,2
      JMP LOOP1
      


SET0: MOV BL,0           ;CAN NOT FIT IN 8 BIT
      MOV MAPP[DI],BL      ; SET 0 IN MAPP
      JMP NEXT             ; JUMP TO SET FOR NEXT ITERATION
      
ENDPR:
.exit

end



