include console.inc

COMMENT *

   ��������� ���������

*

N equ 10

.data

T db 'vedv',0
S db 'fdbdveovbfdb',0 

.code

input_1 proc ; � ������ ���������� 
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   outstrln '������� ���������� ���������'
   inint ecx
   cld
   mov byte ptr [edi], cl
   inc edi
   @cycle1:
      outstr '? '
	  inint al
	  stosb 
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

input_2 proc ; ���������� 0 � �����
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   outstrln '������� ���������� ���������'
   inint ecx
   cld
   @cycle2:
      outstr '? '
	  inint al
	  stosb 
   dec ecx
   JNZ @cycle2
   mov byte ptr [edi], 0
   
   pop edi
   pop eax
   pop ebx
   pop ecx
   
   mov esp, ebp
   pop ebp
ret 4
input_2 endp

output_1 proc
   push ebp
   mov ebp, esp
   
   push ecx
   push eax
   push esi
   
   outstrln '������ '
   mov esi, [ebp+8]
   xor ecx, ecx
   mov cl, byte ptr [esi]
   inc esi 
   cld
   @cycle3:
      lodsb 
      outword al,,' '
   dec ecx
   JNZ @cycle3
   
   pop esi
   pop eax
   pop ecx
   
   mov esp, ebp
   pop ebp
ret 4
output_1 endp

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
      outword al,, ' '  
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
   ConsoleTitle "  "
   
   cld
   xor ebx, ebx
   cycle:
      mov esi, offset T
      mov edi, offset S
	  add edi, ebx
	  
	  cld
	  push edi
	  push esi
	  vcycle:
	     outchar byte ptr[esi]
	     outchar ' '
	     outchar byte ptr[edi]
		 newline
	     cmpsb
		 JNE vihv
	     cmp byte ptr [esi], 0
		 JE vih
	  jmp vcycle
	  pop esi
	  pop edi
	  vihv:
      inc ebx
      cmp byte ptr S+[ebx], 0
   JNE cycle  
   jmp vih2
   vih:
      outstrln ' ��!'
   jmp kon
   vih2:  outstrln ' ���!'
   kon:
   MsgBox "����� ������","��������� ��������� ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start