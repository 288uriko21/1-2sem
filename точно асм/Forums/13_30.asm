include console.inc



COMMENT *
��������������� ��� ������������ SL <EAX,ECX,EDI>,LOAD

pop eax
pop ecx
pop edi

*

.data


.code

SL macro RS, OP ; � ����������� �� OP ������ ��� ������� ��� �������� �� ������ � ����/ �� �����
   for reg, <RS>
      IFIDNI <OP>,<LOAD>
	     pop reg
	  elseifidni <OP>, <SAVE>
         push reg
	  else 
	     outstrln ' ������������ ����� �������'
      endif
   endm            
endm

Start:
   ClrScr
   ConsoleTitle "       13.30"
   
   ; ��� �������� ������������ ������ ������� ��������� ��������� ��������, ������� �� � ����, 
   ; ����� ����������� �� ����� �� �� �������� � �������� �������  
   
   outstrln '  �������� ������������ ������: '
   outstrln '  ������� ��������� <eax, ebx, edx, esi, ebp> ��������� �������� 1, 2, 3, 4, 5 ��������������'
   outstrln ' �������� �� � �����, � ����� ����������� � �������� ������� - "������" <eax, ebx, edx, esi, ebp> ������ "������������"'
   
   k = 1
   for i, <eax, ebx, edx, esi, ebp> ; mov eax, 1 \n mov ebx, 2 --//--
     mov i, k                       
	 k = k+1
   endm
   
   outstr ' �������� esp �� ���������� ���������:  '
   outwordln esp
   SL <eax, ebx, edx, esi, ebp>, Save
   outstr ' �������� esp ����� ���������� ���������:  '
   outwordln esp
   SL <eax, ebx, edx, esi, ebp>, Load
   outstr ' �������� esp ����� �������������� ���������:  '
   outwordln esp
   
   outstrln ' �������� ��������� � ������� eax,ebx, edx, esi, ebp'
   for i, <eax,ebx, edx, esi, ebp>
     outint i,, ' '
   endm
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start