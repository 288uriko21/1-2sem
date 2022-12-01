include console.inc



.data

A dd ?
B dd ?
C dd ?

.code

MaxMin proc 
   push ebp
   mov ebp, esp
   
   push eax
   push ebx
   push esi
   
   mov eax, [ebp+8]
   mov esi, [eax]
   mov ebx, [ebp+12]
   
   cmp esi, [ebx]
   JBE @met
     push esi
	 push dword ptr [ebx]
	 pop dword ptr[eax]
	 pop dword ptr[ebx]
   @met:
   
   pop esi
   pop ebx
   pop eax
   
   mov esp, ebp
   pop ebp
   
 ret 8
MaxMin endp

MaxMinMacro macro X, Y, Z; ������ ��������������� ��������� ���������
; ����������� ������� ��� ��������� ��������, ����� 2 ������, ����� ����� 2 ���������
   push offset Y
   push offset Z
   call MaxMin
   push offset X
   push offset Y
   call MaxMin
   push offset Y
   push offset Z
   call MaxMin
endm

Start:
   ClrScr
   ConsoleTitle "   13.35"
   
   outstrln ' �������:'
   outstr 'A: '
   inint A
   outstr 'B: '
   inint B
   outstr 'C: '
   inint C
   
   outstr '  �� ����� �, �, �: '
   outword A,,' '
   outword B,,' '
   outword C,,' '
   newline
   
   
   .listmacro
   MaxMinMacro A,B,C 
   .nolistmacro
   
   outstr '����� ������������ �, �, �: '
   outword A,,' '
   outword B,,' '
   outword C,,' '
   newline
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start