include console.inc

COMMENT *

   Заготовка программы

*

N equ 5

.data

  S db '*'
  db '.'
  db 'l'
  db '*'
  db '*'
  db 0

.code

input_1 proc ; в начале количество 
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   outstrln 'Введите количество элементов'
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

input_2 proc ; спецсимвол 0 в конце
   push ebp
   mov ebp, esp
   
   push ecx
   push ebx
   push eax
   push edi
   
   mov edi, [ebp+8]
   outstrln 'Введите количество элементов'
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
   
   outstrln 'Массив '
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
   
   outstrln 'Массив '
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
   ConsoleTitle "  "
   
   
  comment +  push offset S
   call output_2
   
   mov edi, offset S
   cld
   mov ecx, N
   cycle:
      mov al, [edi]
	  cmp al, '*'
	  JNE re
	     mov al, '?'
	re: stosb
   loop cycle
   
   push offset S
   call output_2+
   
   mov al, '*'
   mov edi, offset S
   cld
   mov ecx, N
   xor bh, bh
   cycle1: repne scasb
        JNE end1
		inc bh
     cmp ecx, 0		
   JNE cycle1
   end1: outwordln bh
   MsgBox "Конец задачи","Повторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start