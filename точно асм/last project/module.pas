unit module;

interface
uses crt, windows, strings;

  type massiv = array [1..32] of byte;

  const X1_text=1;
        Y1_text=1;
        X2_text=120;
        Y2_text=25; {окно текста, основное для всей программы}
	    LastChar=13; {enter}
	    QuitChar=27; {esc}
	    X1_Sdvig=X1_text+4;
        Y1_Sdvig=Y1_text+4;
  const RText: pchar='текст';
  procedure print(Str: pchar);
  function input(var numb8: shortint;var numb16: integer;var numb32: longint; var col: integer; var mas: massiv):char;
  procedure changeL(var k: integer; c: char);
  procedure paintTF(TF: shortint; m,k: integer);
  procedure sdvc;
  procedure vvod(var mas: massiv; col: integer);
  procedure shll(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure flags(CF,SF,ZF,oOF: integer);
  procedure shlr(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure sar(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure rol(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure ror(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure rcl(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  procedure rcr(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);

  Procedure POSTANOVKA(var numb8: shortint;var numb16: integer;var numb32: longint; pos: integer);
  stdcall;
  external name '_POSTANOVKA@0';
  {$L a.obj}

  procedure SHLLN(var numb8: shortint;var numb16: integer; var numb32: longint; nom, CF: byte);
  stdcall;
  external name '_SHLLN@0';
  {$L a.obj}

implementation
  procedure shll(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
      a: longint;
  begin
    shlln(numb8, numb16, numb32, 1, CF);
    CF:=mas[1];
    ZF:=1;
    for i:=1 to col do begin
       if i<>col then
          mas[i]:=mas[i+1]
       else
          mas[i]:=0;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    if (CF=mas[1]) and (CF=SF) then
       oof:=0
    else
       oof:=1;
  end;

  procedure shlr(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
  begin
    shlln(numb8, numb16, numb32, 2, CF);
    CF:=mas[col];
    ZF:=1;
    for i:=col downto 1 do begin
       if i<>1 then
          mas[i]:=mas[i-1]
       else
          mas[i]:=0;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure sar(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
  begin
    shlln(numb8, numb16, numb32, 3, CF);
    CF:=mas[1];
    ZF:=1;
    for i:=col downto 1 do begin
       if i<>1 then
          mas[i]:=mas[i-1];
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure rol(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
  begin
    shlln(numb8, numb16, numb32, 4, CF);
    CF:=mas[1];
    ZF:=1;
    for i:=1 to col do begin
       if i<>col then
          mas[i]:=mas[i+1]
       else
          mas[i]:=CF;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure ror(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
  begin
    shlln(numb8, numb16, numb32, 5, CF);
    CF:=mas[col];
    ZF:=1;
    for i:=col downto 1 do begin
       if i<>1 then
          mas[i]:=mas[i-1]
       else
          mas[i]:=CF;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure rcl(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
      a: byte;
  begin
    shlln(numb8, numb16, numb32, 6, CF);
    a:= mas[col];
    mas[col]:=CF;
    CF:=mas[1];
    ZF:=1;
    for i:=1 to col-1 do begin
       if i<>col-1 then
          mas[i]:=mas[i+1]
       else
          mas[i]:=a;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure rcr(var CF, SF, ZF, oOF: integer;var numb8: shortint;var numb16: integer;var numb32: longint; col: integer;var mas: massiv);
  var i: integer;
  a: byte;
  begin
    shlln(numb8, numb16, numb32, 7, CF);
    a:=mas[1];
    mas[1]:=CF;
    CF:=mas[col];
    ZF:=1;
    for i:=col downto 2 do begin
       if i<>2 then
          mas[i]:=mas[i-1]
       else
          mas[i]:=a;
       if mas[i]<>0 then
          ZF:=0;
    end;
    SF:=mas[1];
    oof:=2;
  end;

  procedure vvod(var mas: massiv; col: integer);
  var i: integer;
  begin
     for i:=0 to col-1 do begin
        window(3  +i*3,14,4+i*3, 14);
        write(mas[i+1])
     end;
  end;

  function input(var numb8: shortint;var numb16: integer;var numb32: longint; var col: integer; var mas: massiv):char;
  var i, j, m: integer;
      a,a1: longint;
      c: char;
  begin
    window(X1_text,Y1_text,X2_text,Y2_text);
    textbackground(0);
    clrscr;
    window(5, 4, 32, 8);
    textbackground(14);
    textcolor(4);
    clrscr;
    print('  Выберите размер операнда');
    window(7, 5, 30, 7);
    textbackground(9);
    textcolor(White);
    clrscr;
    print('1. Byte');
    writeln();
    print('2. Word');
    writeln();
    print('3. Double word');
    M:=0;
    repeat
      GotoXY(1, M+1);
      c:=readkey;
      if ord(c)=0 then
      begin
        c:=readkey;
        case ord(c) of
          80: if m=2 then m:=0 else m:=m+1;
          72: if m=0 then m:=2 else m:=m-1
        end
      end
    until (ord(c)=LastChar)or(ord(c)=QuitChar);
	if ord(c)=QuitChar then begin input:=c; exit end;
    case m of
      0: col:=8;
      1: col:=16;
      2: col:=32
    end;
    window(X1_text,Y1_text,X2_text,Y2_text);
    textbackground(0);
    clrscr;

    window(17, 10, 50, 11);
    clrscr;
    print('Введите двоичное число');
    for i:=0 to col-1 do begin
      window(2+i*3,13,5+i*3, 15);
      textbackground(15);
      clrscr;
      window(3+i*3,14,4+i*3, 14);
      textbackground(0);
      clrscr
    end;
    numb8:=0;
    numb16:=0;
    numb32:=0;
    for i:=0 to col-1 do begin
      window(3+i*3,14,4+i*3, 14);
      textbackground(0);
      GotoXY(1,1);
      a1:=5;
      while (a1<>1) and (a1<>0)and(ord(c)<>QuitChar) do begin
	     c:=readkey;
		 a:=ord(c)-ord('0');
		 write(a);
         a1:=a;
         if a=1 then postanovka(numb8,numb16, numb32, col-i-1)
         else
          if a<>0 then
            clrscr;
      end;
      mas[i+1]:=a1;
	  if ord(c)=QuitChar then begin input:=c; exit end;
    end;
    a:=1;
    window(17, 10, 50, 11);
    textbackground(0);
    clrscr;

    window(70, 3, 80, 11);
    textbackground(15);
    clrscr;
    sdvc;

    window(3, 16, 80, 16);
    write('CF = ?  ZF = ?  SF = ?  OF = ?');

    window(17, 10, 50, 11);
    clrscr;
    print('Ввести новое число');

    window(17, 7, 50, 9);
    print('Показать число, которое');
    writeln;
    print('сейчас в ячейке в десятичном виде ');

    window(81, 2, 110, 3);
    print('   Второй операнд');
    writeln;
    print('   команды сдвига');
    window(85, 4, 110, 4);
    write('    op2: 1');
  end;

  procedure print(Str: pchar);
  begin
    RText:=str;
    OemToChar(RText, RText);
    write(RText);
    chartooem(RText, RText);
  end;

  procedure changeL(var k: integer; c: char);
  begin
	window(67, 4+k, 69, 4+k);
	clrscr;
    if ord(c)=72 then begin
	  k:=k-1;
	  if k<0 then
	    k:=k+7;
	end
	else if ord(c)=80 then begin
	  k:=k+1;
	  if k>=7 then
	    k:=k-7;
    end
  end;

  procedure paintTF(TF: shortint; m,k: integer);
  begin
    if TF=1 then begin
	  window(67, 4, 69, 10);
	  clrscr;
          window(86, 4, 88, 4);
          clrscr;
      if m=0 then begin
        window(14, 7, 16, 10);
        clrscr;
        window(14, 7, 16, 7);
        write('->');
      end
      else begin
	window(14, 7, 16, 10);
        clrscr;
        window(14, 10, 16, 10);
        write('->');
      end
    end
    else if TF=2 then begin
	  window(14, 7, 16, 10);
	  clrscr;
          window(86, 4, 88, 4);
          clrscr;
	  window(67, 4+k, 69, 4+k);
	  write('->');
	end
        else begin
          window(67, 4, 69, 10);
	  clrscr;
          window(14, 7, 16, 10);
	  clrscr;
	  window(86, 4, 88, 4);
	  write('->');
        end;
  end;

  procedure flags(CF,SF,ZF,oOF: integer);
  begin
    window(3, 16, 80, 16);
    GotoXY(6,1);
    write(CF);
    GotoXY(14,1);
    write(ZF);
    GotoXY(22,1);
    write(SF);
    GotoXY(30,1);
    if oof<>2 then
       write(oOF)
    else
       write('?')
    {'CF = ?  ZF = ?  SF = ?  OF = ?'}
  end;

  procedure sdvc;
  begin
    window(71, 4, 79, 10);
    textbackground(0);
    clrscr;
    GotoXY(1, 1);
    writeln('1) shl');
    writeln('2) shr');
    writeln('3) sar');
    writeln('4) rol');
    writeln('5) ror');
    writeln('6) rcl');
    write('7) rcr')
  end;

end.









