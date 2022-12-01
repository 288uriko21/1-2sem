include console.inc

COMMENT *

   ���������� 2 / 2 ������ - ����������� ������ � ����� ������

*

N equ 200

.data

str3 db N+1 dup (?); ����������
str4 db N+1 dup (?); ���������� 

.code

input_2 proc ; ���������� 0 � �����
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   outstrln '���������� ����� - ������ "."'  
   cld
   @cycle2:
	  outstr '? '
	  inchar al
	  flush
	  stosb 
      cmp al, '.'
   JNE @cycle2
   mov byte ptr [edi-1], 0
   
   pop edi
   pop eax
   pop ebx
   pop ecx
   
   mov esp, ebp
   pop ebp
ret 4
input_2 endp

output_2 proc
   push ebp
   mov ebp, esp
   
   push eax
   push esi
   
   outstrln '������ '
   mov esi, [ebp+8]
   cld
   @cycle4:
      lodsb 
	  cmp al, 0
	  JE @end4
      outchar al
	  outchar ' ' 
   Jmp @cycle4
   @end4:
   
   pop esi
   pop eax
   
   mov esp, ebp
   pop ebp
ret 4
output_2 endp

Start:

   ClrScr
   ConsoleTitle "  ��������� � ������ str3 ������ str4 (��� ���� �������, ��� ���������� ����� �� �����)."
   
   outstrln '���� �����:'
   outstrln 'str3:'
   push offset str3
   call input_2
   newline
   
   outstrln 'str4:'
   push offset str4
   call input_2
   newline
   
   outstrln '�� �����:'
   outstrln 'str3:'
   push offset str3
   call output_2
   newline
   newline
   
   outstrln 'str4:'
   push offset str4
   call output_2
   newline
   newline
   
   mov al, 0
   cld
   mov edi, offset str3
   mov ecx, N
   repne scasb
   dec edi ; ����� ����� ������, � ������� ���� ��������
   
   mov esi, offset str4
   cycle:
      movsb ; ��������� �����������, ���� �� ��������� ����� ������������ ������
	  cmp byte ptr[esi-1], 0
   JNE cycle
   
   outstrln 'C����� str3  � �����:'
   push offset str3
   call output_2
   newline
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start