include console.inc

COMMENT *

   13.8 ������� � ���� ������� DEF X,T,N,V ����������� ������� X �� N
������� V, ��� ������� �������� ���������� T: �������� ���������
T=B ������������� ���� byte, �������� W, D, Q � ����� word, dword, qword.
�������� �����, ������� �������� �������������� �� ����������
��������� �������� ���������:
K EQU 4
DEF C,B,10,''
DEF W,W,K+1,<TYPE C>
DEF ,D,%K+1,%(TYPE W)
DEF A,B,1,<1,2,3>


*

.data

.code


.listmacro
DEF macro X, T, N, V
   forc i, <T>
      X d&T N dup(V) 
   endm	  
endm
.nolistmacro

Start:
   ClrScr
   ConsoleTitle "  "
   
   
   
   
   
   K EQU 4
   .listmacro
   DEF C,B,10,'*'
   DEF W,W,K+1,<TYPE C>
   DEF ,D,%K+1,%(TYPE W)
   DEF A,B,1,<1,2,3>
   .nolistmacro
   
   outstrln offset C
   outstrln offset A
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start