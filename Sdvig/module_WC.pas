Program modul_WC;
Uses CRT,module;
{
   Замятин Андрей
   109 группа
   Практикум №1 "Интерфейс"
   Модуль работы с тестом
}

{Procedure generationNumber(var mas: massiv; col: integer;var numb8: shortint; var numb16: integer; var numb32: longint);
function Vvod_chisla(num: Longint;var L: Longint):boolean;
}
procedure skleika_v_longint(var OP1:Longint; c:byte);
  pascal;
  external name '_skleika_v_longint@0';
  {$L a11.obj}

procedure generationNumber(var mas: massiv; col: integer;var numb8: shortint; var numb16: integer; var numb32: longint);
var i: byte;
begin
  for i:=1 to col do begin
    mas[i] := random(2);
    if mas[i]=1 then
       postanovka(numb8, numb16, numb32, col-i);
  end
end;

{ф-я возвращает True, если ввод правильный, иначе-false}
function Vvod_chisla(num: Longint;var L: Longint):boolean;
var c:char;
    TF: Integer=0;{TF=2, если введено неправильное число}
	str: string='4294967295';
	k:Integer=0;
	A:Longint=0;
	last:byte;
Begin
  Repeat
    c:=readkey;
    if (c>='0')and(c<='9') then
    begin
      write(c);
      if (TF=0)and(ord(c)>ord(str[k])) then
        TF:=2
      else if (TF=0)and(ord(c)<ord(str[k])) then
        TF:=3;
      k:=k+1;
      if k=9 then {считываем последнюю цифру}
        last:=ord(c)-ord('0')
      else
        A:=A*10+ord(c)-ord('0');
    end
  Until (ord(c)=Quitchar)or(ord(c)=Lastchar)or((TF=2)and(k=10))or(k>10);
  if ((TF=2)and(k=10))or(k>10) then
    Vvod_chisla:=False
  else if ((TF=3)or(TF=0))and(k=10) then
  begin
    Vvod_chisla:=True;
    skleika_v_longint(A,last);
  end
  else Vvod_chisla:=True; {самый приятный случай!}
{  While (ord(c)<>Quitchar)and(ord(c)<>Lastchar) do c:=readkey;{оставляет программу на месте}
  L:=A;
end;
var A,B: Longint;
    c:char;
Begin
  B:=12;
  if Vvod_chisla(A,B) then
    Writeln('Wrong')
  else
    Writeln('All right!');
  Writeln(B);
  c:=readkey;
end.