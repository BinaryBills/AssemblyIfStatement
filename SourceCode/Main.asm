;Author: Binary Bills
;Creation Date: March 3,2022
;Modification Date: March 4,2022
;Purpose: Reads a number between 0 and 100 into the register Al and assigns the
;the letter according to the if-statements

INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
prompt db "Input a number between 0-100: ",0	;User prompt
userInput BYTE ?
displayGrade BYTE "Grade: ", 0
displayScore BYTE "Score: ", 0
Grade BYTE ?

.code
main PROC
mov edx, OFFSET prompt 
call writeString	;Prompts user to input integer
call readint	;Reads number from user and places it in the al register

JS EndProg ;Makes sure user enters positive number

cmp AL, 100 ;Makes sure the user entered a number 100 or less
JA ENDPROG

cmp AL, 90 ;Checks if User scored an A
JNAE LessThanA ;Jump if not above 90 or equal to 90
mov Grade,"A"
jmp Result

LessThanA:
cmp AL, 80 ;Checks if User scored a B
JNAE LessThanB ;Jump if not above 80 or equal to 80
mov Grade,"B"
jmp Result

LessThanB:
cmp AL, 70 ;Checks if User scored a C
JNAE LessThanC ;Jump if not above 70 or equal to 70
mov Grade,"C"
jmp Result

LessThanC:
cmp AL, 60 ;Checks if User scored a D
JNAE LessThanD ;Jump if not above 60 or equal to 60
mov Grade,"D"
jmp Result

LessThanD:
mov Grade,"E"
jmp Result


Result:
;Writes Score
mov edx, OFFSET displayScore
call WriteString
call WriteDec
CALL crlf

;Writes Grade
mov edx, OFFSET displayGrade
call WriteString
mov edx, OFFSET Grade
call WriteString
CALL crlf

;End of Program
ENDPROG: 

INVOKE ExitProcess,0
main ENDP
END main