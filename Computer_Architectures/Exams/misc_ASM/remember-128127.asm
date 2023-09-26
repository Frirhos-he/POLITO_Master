.MODEL .small
.STACK
.DATA  

SOURCE DW -10,-20,-100,-10000,-1,-12000,-3,-2,-9000,-12345,-999,-30000,-126,-19999,-1,-32000
MAPP DB 16 DUP(?)
CROSS DW 0


.CODE
.STARTUP
       
XOR SI,SI ;current index
       
loopi:

    CMP SI,30
    JE exit
           
    MOV AX,SOURCE[SI]
    NOT AX
    INC AX ; now it is positive
    
    CMP AX,129    ;0 127 -1 -128
    JL notoverflow
    INC SI 
    INC SI
    JMP loopi
    
notoverflow:
    MOV BX,SI
    SHR BX,1
    MOV MAPP[BX],-1
    ADD CROSS,AX
    
    INC SI
    INC SI 
    JMP loopi  
     
     
     
exit:
    NOT CROSS
    INC CROSS
    ; cross at max can receive -655536 to 655535
    ;in the worst case the sum is -128*16= 2048 thus no, no risk of overflow
    
    
.EXIT