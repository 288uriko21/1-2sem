include console.inc

COMMENT *

   ���������� 1

*

N equ 5

.data

X db N dup (?)
  

.code

input_1 proc ; � ������ ���������� 
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   mov ecx, N
   cld
   @cycle1:
      outstr '? '
	  inchar al
	  flush
	  stosb ; 
   dec ecx
   JNZ @cycle1
   
   pop edi
   pop eax
   pop ebx
   pop ecx
   
   mov esp, ebp
   pop ebp
ret 4
input_1 endp


output_1 proc
   push ebp
   mov ebp, esp
   
   push ecx
   push eax
   push esi
   
   outstrln '������ '
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
output_1 endp



Start:

   ClrScr
   ConsoleTitle "  ����������, ����� �� ������ � ����� �������� ������. ����� Y ��� N"
   
   outstrln ' ���� �������'
   push offset X
   call input_1  
   newline
   outstrln '�� �����: '
   push offset X
   call output_1
   newline
   
   mov edi, offset X
   mov esi, offset X+N/2
   mov ecx, N
   shr ecx, 1 ; ��� �������� �������� ����� ������
   JNC per
   inc esi ; � ������ �������� ����� ������ ������ ������ �������� �� 1 ������� ������, ��� ��� ������
   per:
   cld
   repe cmpsb 
   JNE nerav ; ���������� ������ �� ������� �������������� �����, ���� ������� repe cmpsb ���� �������� ������������ ������������ ���������,
   outcharln 'Y' ; � �� ��������� ecx - ������ �� ����� 
   jmp kon
   nerav: outcharln 'N'
   kon:
   
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start