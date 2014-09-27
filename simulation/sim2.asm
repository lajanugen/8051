;Number of positive and negative numbers in an 8 bit array 
;Array size is 04
;Array starting address is 70h
;Positive count is stored at 50h
;Negative count is stored at 60h
ORG 00h
NEG EQU 50h
POS EQU 60h
ARR EQU 70h

MOV 70h,#3
MOV 71h,#253
MOV 72h,#9
MOV 73h,#113

MOV R5,#00h
MOV R6,#00h
MOV R1,#ARR
MOV R2,#04h
L1:
 CLR C
 MOV A,@R1
 RLC A
 JNC L2
 INC R5
 JMP L3
 L2:
  INC R6
 L3:
  INC R1
DJNZ R2,L1
MOV NEG,R5
MOV POS,R6 
SJMP $
END