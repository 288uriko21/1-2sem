program proc3;

uses crt,module;

type massiv = array [1..32] of byte;

var CF,ZF,SF,otv,sdv,kolvo,col:integer; mas:massiv;
{То, что передает Андрей.
otv - полученное число в десятич системе
sdv - номер сдвига от 1 до 7 (рандом)
kolvo - число от 1 до 5 на сколько будет осущ сдвиг (рандом)
col - ко-во бит в массиве(8-16-32)
mas - массив исходного числа двоичного
и флаги соответственно}
i, masuser,s:integer;



procedure tricomand(x1,y1,x2,y2,CF:integer);
begin
  window(x1,y1,x2,y2);
  textbackground(CF);
  clrscr;
end;

procedure block(var masuser:massiv; x1,y1,col:integer);
var i,x1rem:integer;
    a1: byte;
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
    a1:=5; {Илья Сергеевич, поставьте автомат}
    while (a1<>1) and (a1<>0) and (ord(c)<>QuitChar) do begin
       c:=readkey;
       a1:=ord(c)-ord('0')
    end;
    if ord(c) = QuitChar then
       exit;
    write(a1);
    masuser[i]:=a1;
    x1:=x1+3;
  end;

end;

procedure desyat(var masuser:massiv; col:integer);
var s,i:integer;
begin
  s:=0;
  for i:=1 to (col-1) do
    s:=(s+masuser[i])*2;
  s:=s+masuser[col];
  textcolor(0);
  tricomand(4,24,40,24,7);
  print('Десятичное число: ');
  write(s);
end;

procedure chislo(col:integer);
var masuser : massiv; n:integer;
begin
  textbackground(3);

  tricomand(4,18,24,18,2);
  print('Введи двоичное число:');

  n:=col div 8; {нужно для размера рамки, которая меняется из-за кол-ва бит}
  tricomand(4,20,3+25*n,22,7);
  textcolor(15);
  block(masuser,5,21,col);
  desyat(masuser,col);
end;



procedure zadanie(var mas:massiv; sdv,kolvo,col:integer);
{sdv - сдвиг по номеру
kolvo - op2 в сдвиге}
var m:integer;
begin

  tricomand(4,2,20,2,2);
  print('Условие задания: ');

  tricomand(4,4,4+45,4+7,7);
  textcolor(0);
  print('Сделайте сдвиг, выполнив команду: ');

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
  print('где  A db ');
  for i:=1 to col do
    write(mas[i]);
  write('b');
  gotoxy(1,6);
  print('Результат сдвига вводите в десятичной системе,');
  print('можете воспользоваться ячейкой перевода');
end;

procedure verno(x1,y1,x2,y2:integer);
begin
tricomand(x1,y1,x2,y2,2);
print('Верно');
end;

procedure neverno(x1,y1,x2,y2,vern:integer);
begin
tricomand(x1,y1,x2,y2,4);
print('Неверно');
tricomand(x1,y1+1,x2+10,y2+1,4);
print('Правильно: ');
write(vern);
end;

procedure otvet(otv:integer);
var otvuser:integer;
begin

  textcolor(15);
  textbackground(5);
  tricomand(55,3,93,5,5);
  gotoxy(1,2);
  print('Введите результат(в десятич сист):');
  read(otvuser);
  if otv=otvuser then
    verno(95,4,105,4)
    else
      neverno(95,4,105,4,otv);

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
    c: char;
    a: integer;
begin
  textcolor(15);
  textbackground(5);
  tricomand(55,7,70,7,5);
  write('CF: ');
  readCorrect(CFuser);
  if CF=CFuser then
    verno(95,7,105,7)
    else
      neverno(95,7,105,7,CF);

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
      neverno(95,10,105,10,SF);

end;


procedure ZFlag(ZF:integer);
var ZFuser:integer;
begin
  textcolor(15);
  textbackground(5);
  tricomand(55,13,70,13,5);
  print('ZF: ');
  read(ZFuser);
  if ZF=ZFuser then
    verno(95,13,105,13)
    else
      neverno(95,13,105,13,ZF);
end;


begin
   {только для тестов}
  sdv:=1;kolvo:=1;otv:=10;CF:=1;SF:=1;ZF:=1;


  textbackground(9);
  clrscr;
  read(col);
  for i:=1 to col do
    read(mas[i]);
  clrscr;

  textbackground(3);

  zadanie(mas,sdv,kolvo,col);
  chislo(col);
  otvet(otv);

  CFlag(CF);
  Sflag(SF);
  ZFlag(ZF);
end.
