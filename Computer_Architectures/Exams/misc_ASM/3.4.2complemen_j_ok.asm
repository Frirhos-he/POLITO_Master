.MODEL .small
.STACK
.DATA

SOURCE DB  1,2,3,4,5,6,7,8,9,10,11,12  ;3 rows 4 columns
DESTINATION DB 12 DUP(?)                 ;4 rows 3 columns


.CODE
.STARTUP

;cut by rows
;absolute value don't exceed 120
MOV BX,0 ;index scanning whole source

MOV CX,0
MOV DX,0
XOR SI,SI


loopi:
    CMP BX,12 ; we have done
    JE exit
    
    MOV AL,SOURCE[BX]                           ;source to be converted

    NOT AL
    INC AL
    
    MOV SI,BX
    AND SI,3
    MOV CX,SI     ;buffer
    SHL CX,1
    ADD SI,CX     ;3*[0-3]   
    ADD SI,DX     ;3*[0-3] +current row
    
    MOV DESTINATION[SI],AL
                                       
    INC BX  
    MOV CX,BX
    AND CX,3
    CMP CX,0
    JE foundrow
    JMP loopi
    
    
    
foundrow:
    INC DX
    JMP loopi                                     
                                       
    
    
    
    


exit:
    


.EXIT