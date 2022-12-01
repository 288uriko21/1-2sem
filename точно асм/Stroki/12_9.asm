include console.inc

COMMENT *

   Заготовка программы

*
.data
N = 100
T db N-90 dup ('n')
  db 90 dup ('.')

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
   
  COMMENT * ; a
   mov al, '.'
   mov edi, offset T
   mov ecx, N
   cld
   repne scasb 
   dec edi
    
   mov byte ptr [edi], '!'
   ;outchar '3'
   outcharln byte ptr T+9
   ;outchar '4'
   outcharln byte ptr T+10
   ;outchar '5'
   outcharln byte ptr T+11 *
   ;b
   
   mov al, 'n'
   std
   mov edi, offset T+99
   scasb
   
   MsgBox "Конец задачи","Повторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start