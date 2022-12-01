include console.inc



COMMENT *
макрорасширение для макрокоманды SL <EAX,ECX,EDI>,LOAD

pop eax
pop ecx
pop edi

*

.data


.code

SL macro RS, OP ; в зависимости от OP кладём или достаём все регистры из списка в стек/ из стека
   for reg, <RS>
      IFIDNI <OP>,<LOAD>
	     pop reg
	  elseifidni <OP>, <SAVE>
         push reg
	  else 
	     outstrln ' Некорректный вызов макроса'
      endif
   endm            
endm

Start:
   ClrScr
   ConsoleTitle "       13.30"
   
   ; дл€ проверки правильности работы зададим регистарм начальные значени€, положим их в стек, 
   ; потом восстановим из стека те же регистра в обратном пор€дке  
   
   outstrln '  ѕроверка правильности работы: '
   outstrln '  зададим регистрам <eax, ebx, edx, esi, ebp> начальные значени€ 1, 2, 3, 4, 5 соответственно'
   outstrln ' сохраним их в стеке, а затем восстановим в обратном порядке - "массив" <eax, ebx, edx, esi, ebp> должен "развернуться"'
   
   k = 1
   for i, <eax, ebx, edx, esi, ebp> ; mov eax, 1 \n mov ebx, 2 --//--
     mov i, k                       
	 k = k+1
   endm
   
   outstr ' значение esp до сохранения регистров:  '
   outwordln esp
   SL <eax, ebx, edx, esi, ebp>, Save
   outstr ' значение esp после сохранения регистров:  '
   outwordln esp
   SL <eax, ebx, edx, esi, ebp>, Load
   outstr ' значение esp после восстановления регистров:  '
   outwordln esp
   
   outstrln ' «начения регистров в порядке eax,ebx, edx, esi, ebp'
   for i, <eax,ebx, edx, esi, ebp>
     outint i,, ' '
   endm
   
   MsgBox " онец задачи","ѕовторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start