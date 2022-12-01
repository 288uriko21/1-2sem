program proc3;

uses crt,module,module_Ang;

type massiv = array [1..32] of byte;


{��, �� ��।��� ���३.
otv - ����祭��� �᫮ � ������ ��⥬�
sdv - ����� ᤢ��� �� 1 �� 7 (࠭���)
kolvo - �᫮ �� 1 �� 5 �� ᪮�쪮 �㤥� ���� ᤢ�� (࠭���)
col - ��-�� ��� � ���ᨢ�(8-16-32)
mas - ���ᨢ ��室���� �᫠ ����筮��
� 䫠�� ᮮ⢥��⢥���}



procedure tricomand(x1,y1,x2,y2,CF:integer);
begin
  window(x1,y1,x2,y2);
  textbackground(CF);
  clrscr;
end;

function block(var masuser:massiv; x1,y1,col:integer): integer;
var i,x1rem:integer;
    a1: integer;
    c: char;
begin
   textbackground(0);
   x1rem:=x1;
  for i:=1 to col do
  begin
    window(x1,y1,x1+1,y1);
    clrscr;
    x1:=x1+3;
  end;

  x1:=x1rem;
  for i:=1 to col do
  begin
    window(x1,y1,x1+1,y1);
    a1:=5;
    while (a1<>1) and (a1<>0) and (ord(c)<>QuitChar) and  (ord(c)<>77) do begin
       c:=readkey;
       a1:=ord(c)-ord('0')
    end;
    if ord(c) = QuitChar then begin
       block:=QuitChar;
       exit
    end;
    if ord(c) = 77 then begin
       block:=77;
       exit
    end;
    write(a1);
    masuser[i]:=a1;
    x1:=x1+3;
  end;
  block:=0;
end;

procedure desyat(var masuser:massiv; col:integer);
var s:longint;
    i:byte;
begin
  s:=0;
  for i:=1 to (col-1) do
    s:=(s+masuser[i])*2;
  s:=s+masuser[col];
  textcolor(0);
  tricomand(4, 24, 60, 27,11);
  tricomand(4,24,30,24,7);
  print('�����筮� �᫮: ');
  write(s);
end;

function chislo(col:integer; var mas: massiv): integer;
var masuser : massiv; n, i:integer;
    c: integer;
    c1: char;
    prav: boolean;
begin
  textbackground(3);

  tricomand(4,17,40,18,2);
  print('����� ����筮� �᫮:');
  writeln;
  print('������ > �⮡� �ய����� �⠯');

  n:=col div 8; {�㦭� ��� ࠧ��� ࠬ��, ����� ������� ��-�� ���-�� ���}
  tricomand(4,20,3+25*n,22,7);
  textcolor(15);
  c:=block(masuser,5,21,col);
  if c=QuitChar then begin
    chislo:=QuitChar;
    exit
  end;
  if c=77 then begin
    chislo:=77;
    exit
  end;
  textcolor(0);
  tricomand(4, 24, 60, 27, 7);
  print('������ Enter �⮡� �த������');
  writeln;
  print('+ �⮡� �஢���� ����񭭮� ����筮� �᫮');
  writeln;
  print('d, �⮡� �뢥�� �����筮� ����������� �᫮ �� �祩��');
  c1 := readkey;
  case ord(c1) of
     100: desyat(masuser,col);
     43: begin
             prav:=True;
             for i:=1 to col do begin
               if mas[i] <> masuser[i] then begin
                  prav:=False;
                  window(61 ,24, 67, 24);
                  textcolor(4);
                  write('Error')
               end
             end;
             if prav then begin
                window(61 ,24, 67, 24);
                textcolor(10);
                write('Ok');
             end;
         end;
  end;
  tricomand(4, 28, 60, 29, 11);
  textcolor(0);
  print('������ Enter �⮡� �த������ ��� "r",');
  writeln;
  print('�⮡� ����� ��㣮� �᫮');
  c1:=readkey;
  if ord(c1)=114 then begin
     tricomand(4, 28, 60, 29,11);
     tricomand(61 ,24, 67, 24, 11);
     chislo:=chislo(col, mas);
  end
  else
    chislo:=0;
end;

procedure zadanie(var mas:massiv; sdv,kolvo,col:integer);
{sdv - ᤢ�� �� ������
kolvo - op2 � ᤢ���}
var m,i:integer;
begin
  tricomand(4,2,20,2,2);
  print('�᫮��� �������: ');

  tricomand(4,4,4+45,4+7,7);
  textcolor(0);
  print('������� ᤢ��, �믮���� �������: ');

  gotoxy(3,3);
  textcolor(4);

  case sdv of
  1: print('shl   ');
  2: print('shr   ');
  3: print('sar   ');
  4: print('rol   ');
  5: print('ror   ');
  6: print('rcl   ');
  7: print('rcr   ');
  end;

  write('A  ,  ',kolvo);
  gotoxy(3,4);
  textcolor(0);
  print('���  A db ');
  for i:=1 to col do
    write(mas[i]);
  write('b');
  gotoxy(1,6);
  print('������� ᤢ��� ������ � �����筮� ��⥬�,');
  print('����� ��ᯮ�짮������ �祩��� ��ॢ���');
  writeln;
  print('��砫쭮� ���祭�� CF = 0')
end;

procedure verno(x1,y1,x2,y2:integer);
begin
tricomand(x1,y1,x2,y2,2);
print('��୮');
end;

procedure neverno(x1,y1,x2,y2:integer;numb8:shortint;numb16:integer;numb32:longint;col:integer);
begin
tricomand(x1,y1,x2,y2,4);
print('����୮');
tricomand(x1,y1+1,x2+5,y2+1,4);
print('�ࠢ��쭮: ');
case col of
8: write(numb8);
16: write(numb16);
32: write(numb32);
end;
end;

procedure nevernoF(x1,y1,x2,y2,vern:integer);
begin
tricomand(x1,y1,x2,y2,4);
print('����୮');
tricomand(x1,y1+1,x2+5,y2+1,4);
print('�ࠢ��쭮: ');
write(vern);
end;

procedure otvet(var unumb8: shortint; var unumb16: integer; var unumb32: longint; numb8: shortint; numb16: integer; numb32: longint; col: Integer);
var otv, userotv:longint;
begin
  textcolor(15);
  textbackground(5);
  tricomand(55,3,93,5,5);
  gotoxy(1,2);
  print('������ १����(� ������ ���.):');
  Vvod_chisla(col,unumb8,unumb16,unumb32);
  case col of
  8:
  begin
    if numb8=unumb8 then verno(95,4,105,4)
    else neverno(95,4,105,4,numb8,numb16,numb32,col)
  end;
  16:
  begin
    if numb16=unumb16 then verno(95,4,105,4)
    else neverno(95,4,105,4,numb8,numb16,numb32,col)
  end;
  32:
  begin
    if numb32=unumb32 then verno(95,4,105,4)
    else neverno(95,4,105,4,numb8,numb16,numb32,col)
  end;
  end;
end;

procedure readCorrect(var a: integer);
var a1: integer;
     c: char;
begin
  a1:=5;
  while (a1<>1) and (a1<>0) and (ord(c)<>QuitChar) do begin
     c:=readkey;
     a1:=ord(c)-ord('0')
  end;
  if ord(c) = QuitChar then
     exit;
  write(a1);
  a:=a1;
end;

procedure CFlag(CF:integer);
var CFuser:integer;
begin

  textcolor(15);
  textbackground(5);
  tricomand(55,7,70,7,5);
  print('CF: ');
  readCorrect(CFuser);
  if CF=CFuser then
    verno(95,7,105,7)
    else
      nevernoF(95,7,105,7,CF);

end;

procedure SFlag(SF:integer);
var SFuser:integer;
begin
  textcolor(15);
  textbackground(5);
  tricomand(55,10,70,10,5);
  print('SF: ');
  readCorrect(SFuser);
  if SF=SFuser then
    verno(95,10,105,10)
    else
      nevernoF(95,10,105,10,SF);

end;


procedure ZFlag(ZF:integer);
var ZFuser:integer;
begin
  textcolor(15);
  textbackground(5);
  tricomand(55,13,70,13,5);
  print('ZF: ');
  readCorrect(ZFuser);
  if ZF=ZFuser then
    verno(95,13,105,13)
    else
      nevernoF(95,13,105,13,ZF);
end;

procedure Ang_proc();
var CF,ZF,SF,oOF,sdv,kolvo,col:integer;
    mas:massiv;
    i, masuser,s:integer;
    c:char;
    ouserotv:longint;
    numb8,unumb8:shortint;
    numb16,unumb16:integer;
    numb32,unumb32:longint;
begin
  CF:=0;ZF:=0;SF:=0;oOF:=0;
  col:=8;
  sdv:=generationSdvig(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas,kolvo);
  tricomand(90,60,80,120,black);
  case col of
    8: write(numb8);
    16:write(numb16);
    32:write(numb32);
  end;
  c:=readkey;
  textbackground(3);
  clrscr;


  zadanie(mas,sdv,kolvo,col);

  for i:=1 to kolvo do
    sdvig(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas, sdv);

  s:=chislo(col, mas);
  if s=QuitChar then
     exit;

  otvet(unumb8,unumb16,unumb32,numb8,numb16,numb32,col);
  CFlag(CF);
  Sflag(SF);
  ZFlag(ZF);
end;

var CF,ZF,SF,oOF,sdv,kolvo,col:integer;
    mas:massiv;
    i, masuser,s:integer;
    c:char;
    otv,userotv:longint;
Begin
  CF:=0;
  Ang_proc();
  c:=readkey;
end.
