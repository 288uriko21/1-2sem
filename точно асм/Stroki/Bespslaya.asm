include console.inc

COMMENT *

   �������� �1

*

N equ 8

.data

X db 'abcdengh'
  

.code


output proc
   push ebp
   mov ebp, esp
   
   push ecx
   push eax
   push esi
   
   
   mov esi, [ebp+8]
   mov ecx, N
   cld
   @cycle3:
      lodsb 
      outchar al
	  outchar ' '
   dec ecx
   JNZ @cycle3
   
   pop esi
   pop eax
   pop ecx
   
   mov esp, ebp
   pop ebp
ret 4
output endp



Start:

   ClrScr
   ConsoleTitle "  �1"
   
 
   outstrln ' �������� ������:'
   push offset X
   call output
   newline
   
   mov esi, offset X
   mov edi, offset X+3*(N/4)
   mov ecx, N/4
   cld
   rep movsb 
   
   
   outstrln ' ���������:'
   push offset X
   call output
   
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start