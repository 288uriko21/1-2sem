include console.inc

COMMENT *

   Заготовка программы

*

N equ 10

.data

X db ? ; в начале количество
  db 100 dup (?)

Y db 101 dup (?); спецсимвол
  

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
   
   push offset X
   call input_1
   
   newline
   
   push offset X
   call output_1
   newline
   newline
   
   push offset Y
   call input_2
   
   newline
   
   push offset Y
   call output_2
   newline
   newline
   
   MsgBox "Конец задачи","Повторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start