include console.inc

COMMENT *

   13.8 ќписать в виде макроса DEF X,T,N,V определение массива X из N
величин V, тип которых задаетс€ параметром T: значение параметра
T=B соответствует типу byte, значени€ W, D, Q Ч типам word, dword, qword.
¬ыписать текст, который построит макрогенератор по следующему
фрагменту исходной программы:
K EQU 4
DEF C,B,10,''
DEF W,W,K+1,<TYPE C>
DEF ,D,%K+1,%(TYPE W)
DEF A,B,1,<1,2,3>


*

.data

.code


.listmacro
DEF macro X, T, N, V
   forc i, <T>
      X d&T N dup(V) 
   endm	  
endm
.nolistmacro

Start:
   ClrScr
   ConsoleTitle "  "
   
   
   
   
   
   K EQU 4
   .listmacro
   DEF C,B,10,'*'
   DEF W,W,K+1,<TYPE C>
   DEF ,D,%K+1,%(TYPE W)
   DEF A,B,1,<1,2,3>
   .nolistmacro
   
   outstrln offset C
   outstrln offset A
   
   MsgBox " онец задачи","ѕовторить программу ?",MB_YESNO+MB_ICONQUESTION
   cmp  eax,IDYES
   je   Start
   exit
   end Start