.MODEL SMALL 
.DATA
    MSG  DB "ENTER DECIMAL NUMBER :","$"
    MSG1 DB 10,10,"BINARY NUMBER IS :","$"
.CODE
    MAIN PROC FAR
        .STARTUP
        
        ;PRINT MESSAGE ENTER MSG& READnUMBER
        LEA dx,MSG
        CALL PRINTMESAGE
        CALL READNUMBER
        
        SUB AL,48
        MOV AH,0
        MOV BX,2
        MOV DX,0
        MOV CX,0
    A: 
        DIV BX ;AX=05 =>AL,5,AH=>0,05/BX
        PUSH DX
        INC CX
        CMP Al,0
        JNE A
        
       LEA DX,MSG1
       CALL PRINTMESAGE
   B: 
        POP DX
       ADD DX,48
       CALL PRINTCHAR
       loop B
        
        .EXIT
    ENDP MAIN
    ;printM
    PRINTMESAGE PROC 
        MOV AH,09H
        INT 21H
        RET
    ENDP PRINTMESAGE
    ;READ NUMBER DECIMAL
    READNUMBER PROC 
        MOV AH,01H
        INT 21H
        RET
    ENDP READNUMBER
    ;printCHAR
    PRINTCHAR PROC
        MOV AH,02H
        INT 21H
        ret
    ENDP PRINTCHAR
    
END MAIN
    