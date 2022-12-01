
Uses CRT;
Var X:Integer;      C:Char;
Begin ClrScr;
 Window(1,1,80,25);
TextColor(15);
 TextBackGround(0); ClrScr;
gotoxy(20,10);
 Writeln('NUMBER    <              >');
 gotoxy(10,30); TextColor(6);
 Writeln('USE <-- and -->');
 Write('press ESC   - the end');
 Window(39,10,41,10); TextColor(12);
 TextBackGround(3);
  X:=5;   ClrScr;     Write(' ',x);
  Repeat   C:=Readkey;
  IF ORD(C)=0 tHEN
  Begin c:=ReadKey;
      Case Ord(c) of
    77 : If X<9 Then X:=X+1;
    75: if X>0 Then X:=X-1
    End;ClrScr;     Write(' ',x);
  end
  Until ord(C)=27
End.
