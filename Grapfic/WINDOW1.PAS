Uses CRT;
Var K:Integer;      C:Char;
Begin
 ClrScr;
 Window(1,1,80,25);
TextColor(15);
 TextBackGround(0); ClrScr;
gotoxy(20,10);
 Writeln('2 big latin latters');
 gotoxy(10,30); TextColor(6);
 Writeln;
 Writeln('and ENTER');
 Writeln ('You can use BS');
 Window(39,11,41,11); TextColor(12);
 TextBackGround(3);   ClrScr;
  K:=0; {количество уже введеннызх букв}
  Repeat   C:=Readkey;
    IF (C>='A') and (C<='Z')and (k<2) then begin Write(c); K:=k+1 end;
    If ord(c)=8 Then If K>0 Then Begin K:=K-1; gotoxy(k+1,1); Write(' ');
                                              gotoxy(k+1,1)
                                 End;
  Until (ord(C)=13)and (k=2)
End.
