include console.inc

COMMENT *

   ��������� ���������
   ��������������� (� ������� ��������� DB) ����� � ������
��� 40 ������, �������� �� � �������� ��������� ��������
������ 40 �������� ����� (1, 3, 5, �, 79).

*

.data

a db 1

.code



Start:
   ClrScr
   ConsoleTitle "  "
   
   .listmacro
   mov ecx, 40
   met:
   FOR i, <a>
      db 9
	  inc a
	  inc a
   endm
   loop met
   .nolistmacro
   
   
   mov ecx, 40
   met1:
   outint a+[ecx]
   loop met1
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start