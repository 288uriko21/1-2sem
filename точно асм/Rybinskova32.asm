include console.inc

COMMENT *���������� 4-y-3 (������� �������, ��������, ����� ��� �����)*

n EQU 1; ������ ���������� ������� 
N EQU 1; -//- ��������

.data?
X dw n dup (?)
Y dw N dup (?)
.code

input proc; ���� (�������� ������ �� ������ ������� � ���-�� ���������)
   push ebp
   mov ebp, esp
   
   push ecx
   push esi
   push edx
   push eax
   
   mov esi, [ebp+8]
   mov ecx, [ebp+12]
   xor edx, edx
   @cycle:
      @@:    
      outstr '? '     
      inint eax
	  cmp eax, 65535
	  JBE @F
	  outstrln ' ������� �������� �����, ���������� ����� '
	  jmp @B
	  @@:
      mov word PTR [esi+edx*2], ax
      inc edx
      dec ecx
   JNE @cycle; 
   
   pop eax
   pop edx
   pop esi
   pop ecx
   
   mov esp, ebp
   pop ebp
   ret 8
input endp

   
output proc; ����� (�������� ������ �� ������ ������� � ���������� ���������)
   push ebp
   mov ebp, esp
   
   push edx
   push esi
   push ecx
   
   mov ecx, [ebp+12]
   mov esi, [ebp+8]
   xor edx, edx
   @@:         
      outword word PTR ([Esi+Edx*2]),,' '
      inc edx
   loop @B
   
   pop ecx
   pop esi
   pop edx

   mov esp, ebp
   pop ebp
   ret 8
output endp

sort proc; �������� ������ �� ������ ������� � ���������� ���������  
   push ebp
   mov ebp, esp
   
   push ebx
   push eax
   push ecx
   push esi
   push edx
   push edi
   
   
   mov ebx, [ebp+8]
   mov esi, 1; ������ �������(������) ����������� � ��������� ������� �������
   mov ecx, [ebp+12]
   dec ecx
   cmp ecx, 1
   JE @end6
   CYCLE2: 
      mov ax, word PTR([ebx]+[esi*2])
	  mov edx, esi 
	  @@: ; ���������� ������� ��������������� � �����������, ������� � ��������������� ��� � �.�.(���� ������� ��� �������)
	     dec edx
		 cmp edx, -1 ; �����, ����� �� �������� ������� ��� �������
		 JE @F
	     cmp ax, word PTR([ebx]+[edx*2])
	  JA @B
	  @@:
	  inc edx 
	  push ecx 
	  mov ecx, esi
	  sub ecx, edx  
	  inc ecx ; ���������� ������������, ������� ���������� ������� ��� ������� 
	  VCYCLE: ; ����� ������� � ������� (������������ � ������)
	     mov di, word PTR([ebx]+[edx*2])
		 mov word PTR([ebx]+[edx*2]), ax
		 inc edx
		 mov ax, di 
	  loop VCYCLE
	  inc esi
	  pop ecx
   loop CYCLE2
   @end6:
   pop edi
   pop edx
   pop esi
   pop ecx
   pop eax
   pop ebx
   
   mov esp, ebp
   pop ebp
   ret 8
sort endp

Start:
   ClrScr
   ConsoleTitle "   ���������� �������� ���������"  
   
   newline
   outstr '������� '
   outword N
   outstrln ' ��������� �������� �������'
   push N
   push offset Y
   call input
   
   outstr '������� '
   outword n
   outstrln ' ��������� ���������� �������'
   push n
   push offset X
   call input
   
   newline
   outstrln '�� �����: '
   outstr '��������� ������: '
   push n
   push offset X
   call output
   newline
   outstr '������� ������: '
   push N
   push offset Y
   call output
   newline
   
   newline
   push n
   push offset X
   call sort
   push N
   push offset Y
   call sort
      
   outstrln '��������������� ��������� ������:'
   push n
   push offset X
   call output
   newline
   newline
   outstrln '��������������� ������� ������:'
   push N
   push offset Y
   call output
   newline
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start