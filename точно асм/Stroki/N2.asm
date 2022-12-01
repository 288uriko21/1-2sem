include console.inc

COMMENT *

   Рыбинскова 2 / 1 способ - в начале строки количество элементов

*

N equ 200 ; макксимально допустимая длина

.data

str3 db ? ; в начале количество
  db N dup (?)

str4 db ? ; в начале количество
  db N dup (?)
  

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
	  inchar al
	  flush
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
   ConsoleTitle "  Приписать к строке str3 строку str4 (при этом считаем, что превышения длины не будет)."
   
   outstrln 'Ввод строк:'
   outstrln 'str3:'
   push offset str3
   call input_1
   newline
   
   outstrln 'str4:'
   push offset str4
   call input_1
   newline
   
   outstrln 'Вы ввыли:'
   outstrln 'str3:'
   push offset str3
   call output_1
   newline
   newline
   
   outstrln 'str4:'
   push offset str4
   call output_1
   newline
   newline
   
   mov edi, offset str3
   xor eax, eax
   add al, str3
   add edi, eax
   inc edi
   mov esi, offset str4 
   xor ecx, ecx
   mov cl, [esi]
   inc esi
   rep movsb ; пересылка посимвольно количества символов, равного количеству символов в str4
   
   xor eax, eax
   mov al, byte ptr str3
   add al, byte ptr str4
   mov byte ptr str3, al
   
   outstrln 'Cтрока str3  в конце:'
   push offset str3
   call output_1
   newline
   
   MsgBox "Конец задачи","Повторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start