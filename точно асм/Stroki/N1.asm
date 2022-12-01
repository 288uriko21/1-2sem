include console.inc

COMMENT *

   Рыбинскова 1

*

N equ 5

.data

X db N dup (?)
  

.code

input_1 proc ; в начале количество 
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
   
   outstrln 'Массив '
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
   ConsoleTitle "  Определить, равны ли правая и левая половина строки. Ответ Y или N"
   
   outstrln ' Ввод массива'
   push offset X
   call input_1  
   newline
   outstrln 'Вы ввели: '
   push offset X
   call output_1
   newline
   
   mov edi, offset X
   mov esi, offset X+N/2
   mov ecx, N
   shr ecx, 1 ; для проверки чётности длины строки
   JNC per
   inc esi ; в случае нечётной длины строки начало второй половины на 1 позицию правее, чем при чётной
   per:
   cld
   repe cmpsb 
   JNE nerav ; сравниваем строки до первого несовпадающего цикла, если команда repe cmpsb была прервана неравенством сравниваемых элементов,
   outcharln 'Y' ; а не счётчиком ecx - строки не равны 
   jmp kon
   nerav: outcharln 'N'
   kon:
   
   MsgBox "Конец задачи","Повторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start