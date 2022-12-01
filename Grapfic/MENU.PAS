{В файле t.txt  находится меню - каждое задание на отдельной строке
С помощью программы пользователь стрелочками вверх-вниз и
клавишей ввода выбирает нужную строчку -
на экране печатается номр выбранной задаче
(в реальности далее должна выполняться подрограмма,
 решающая выбранную задачу }

Uses CRT;

TYpe
     Stroka=String[40];

Function Menu(Fname:Stroka; x,y:Integer):Integer;
Var F             : Text;
    k,M,i,W        : Integer;
    S              : Stroka;
    C,hh           : Char;

Begin
 Assign(F,FName); Reset(F); K:=0;
   While KeyPressed do
    C:=ReadKey;
 GotoXY(X,Y);         clrScr;
 While Not(Eof(F))DO
 Begin  Readln(F,S); GotoXY(X,Y+K);
        K:=K+1; Writeln(k:2,'.  ',S);
 End;   M:=1;  Close (F);

 Repeat GotoXY(X+3,Y+M-1);
   C:=ReadKey;
   If Ord(c)=0 Then Begin C:=ReadKey;
                          Case Ord(c) of
                           80: If M=K then M:=1 else M:=M+1;
                           72: if M=1  then M:=K else M:=M-1;
                          End;

                End;
 Until (Ord(c)=13)or(Ord(c)=27);
 if Ord(c)=13 then Menu:=M Else Menu:=0;
 ClrScr
End;
Var m:Integer;
Begin M:=Menu('t.txt',30,10);
ClrScr; Writeln(M)
End.