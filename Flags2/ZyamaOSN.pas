Program Flag;
Uses doc, CRT;

{
   Замятин Андрей
   109 группа
   Практикум №2.1 "Флаги"
}
type El = record
            size: integer;
            Op1: Longint;
            Op2: Longint;
          end;
     Bin = String;
     Bin_El = record
                size: integer;
                Op1: Bin;
                Op2: Bin;
              end;

{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{Модуль работы с файлом}

var FR, FW: Text;

{т.к. на вход идет файл txt и длины чисел неизвестны,
                       будем вычислять число посимвольно}

Procedure El_File(var FR: Text; var A: El);
var c: Char;
Begin
  With A do
    {Пользуюсь тем, что в строке 3 числа,разделенных пробелом}
    Readln(FR, size, Op1, Op2);
end;

{конец модуля работы с файлом}
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{Модуль работы с El}

Procedure El_to_Bin_El(A: El; var B: Bin_El);
 {Перевод числа в двоичное число (строка Bin)
   если число не поместилось, то вводим в массив -}
var TF: Boolean;
Begin
  B.size := A.size;
  B.Op1 := to_bin(A.Op1, A.size);
  B.Op2 := to_bin(A.Op2, A.size);
end;

{Функции суммы и вычитания с изменением флагов}
var CF, OvF, SF, ZF, i: Integer;

Function bin_add(B: Bin_El): Bin;
var s: Bin;
    c: Bin;
    S1, S2, Rez: Integer;
Begin
  CF := 0;
  ZF := 1;
  s := '';
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  {проверка на вместимость числа в указанное число бит}
  Begin
   for i := B.size downto 1 do
   Begin
     S1 := ord(B.Op1[i]) - ord('0'); {S1 и S2 либо 0 либо 1}
     S2 := ord(B.Op2[i]) - ord('0');
     Rez := CF + S1 + S2;
     s := chr(Rez mod 2 + ord('0')) + s;
     CF := Rez div 2;
     if s[1] = '1' then
       ZF := 0;
   end;
   if s[1] = '1' then
     SF := 1
   else
     SF := 0;
   if (B.Op1[1] = B.Op2[1]) and (s[1] <> B.Op1[1]) then
     OvF := 1
   else
     OvF := 0;
   bin_add := s;
  end
  else
   bin_add := 'Wrong'
end;

Function bin_sub(B: Bin_El): Bin;
var s: Bin;
    c: Bin;
    S1, S2, Rez: Integer;
Begin
  CF := 0;
  ZF := 1;
  s := '';
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  {проверка на вместимость числа в указанное число бит}
  Begin
   for i := B.size downto 1 do
   Begin
     S1 := ord(B.Op1[i]) - ord('0');
     S2 := ord(B.Op2[i]) - ord('0');
     Rez := 2 - CF + S1 - S2;
     s := chr(Rez mod 2 + ord('0')) + s;
     CF := 1 - Rez div 2;
     if s[1] = '1' then
       ZF := 0;
   end;
   if s[1] = '1' then
     SF := 1
   else
     SF := 0;
   if (B.Op1[1] <> B.Op2[1]) and (s[1] = B.Op2[1]) then
     OvF := 1
   else
     OvF := 0;
   bin_sub := s
  end
  else
   bin_sub := 'Wrong'
end;

{конец модуля работы с El и Bin_El}
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{Модуль вывода}

Procedure Vivod(var FW: text; A: El);
 Function bz_dec(x: Longint; l: Integer): Longint;
 {Перевод числа в бз, и если оно большое или отриц, то меняем цвет}
 Begin
   TextColor(2);
   if x >= deg(l) then    {Не помещается в ук число бит}
   begin
     TextColor(4);
     x := x mod deg(l)
   end;
   if x < 0 then   {Если на вход пришло отриц, то меняем цвет}
   begin
     x := x + deg(l);
     TextColor(4);   {Цвет играет роль только после нахождения z}
   end;
   bz_dec := x;
 end;
 Function zn_dec(x: Longint; l: Integer): Longint;
 {Перевод числа в знаковое, если оно слишком мало или слишком большое положительное}
 Begin
   TextColor(2);
   if x >= deg(l) then    {При неправильном рез, меняем цвет}
   begin
     TextColor(4);
     x := x mod deg(l);
   end;
   if x >= deg(l - 1) then
   begin
     TextColor(4);
     x := x - deg(l);
   end;
   if (x < 0) and (abs(x) > deg(l - 1)) then {Слишком большое отр}
   begin
     TextColor(4);
     x := x + deg(l)
   end;
   zn_dec := x;
 end;
 Procedure Vivod1(A: El);
  Procedure Write1(x: Longint);
  {Вывод отр числа со скобками}
  Begin
    if x < 0 then
      Write('(', x, ')')
    else
      Write(x);
  end;
 var x1, x2: Longint;
     y1, y2: Longint;
     z: Longint;
 Begin
   x1 := bz_dec(A.Op1, A.size);    {Переводим ОП1 и ОП2 в бз и зн}
   x2 := bz_dec(A.Op2, A.size);
   y1 := zn_dec(A.Op1, A.size);
   y2 := zn_dec(A.Op2, A.size);

   z := x1 + x2;
   z := bz_dec(z, A.size); {Переводим z в бз, и меняем цвет, если z поменялся}
   Write(x1,'+');
   Write1(x2);             {Вывод x2 со скобками, если он отр}
   Write('=',z,' ');

   z := y1 + y2;
   z := zn_dec(z, A.size);
   Write(y1,'+');
   Write1(y2);
   Write('=',z,' ');

   z := x1 - x2;
   z := bz_dec(z, A.size);
   Write(x1,'-');
   Write1(x2);
   Write('=',z,' ');

   z := y1 - y2;
   z := zn_dec(z, A.size);
   Write(y1,'-');
   Write1(y2);
   Write('=',z,' ');
   TextColor(15);
   Writeln;
 end;
var B: bin_El;
    BSum: Bin;
    BSub: Bin;
    i: Integer;
Begin
  El_to_bin_El(A, B);
  Write(A.size, ' ');
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  begin
    Vivod1(A);          {Вывод строчки, при верных вх данных}
    i := B.size + 2;
    BSum := bin_add(B);

    Writeln(FW, A.Op1, ' ', A.Op2);
    Write(FW, '+ ', B.Op1, B.Op2:i, BSum:i);
    Write(FW, to_dec(BSum):B.size, to_dec_zn(BSum, B.size):B.size);
    Writeln(FW, '  ', ZF,SF,CF,OvF);

    BSub := bin_sub(B);
    Write(FW, '- ', B.Op1, B.Op2:i, BSub:i);
    Write(FW, to_dec(BSub):B.size, to_dec_zn(BSub, B.size):B.size);
    Writeln(FW, '  ', ZF,SF,CF,OvF);

    Writeln(FW);
  end
  else
  begin
    if B.Op1 = '2' then
      Writeln('ERROR ', A.Op1, ' is too large')
    else
    if B.Op2 = '2' then
      Writeln('ERROR ', A.Op2, ' is too large')
  end;
end;

var A: El;
    c: Bin;
    Read_Name, Write_Name: string;
Begin
  ClrScr;
  TextBackground(0);
  Write('First file - ');
  readln(Read_Name);
  Write('Second file - ');
  Readln(Write_Name);
  Assign(FR, Read_Name);
  Assign(FW, Write_Name);
  Reset(FR);
  Rewrite(FW);
  Writeln('****************************');
  While not(eof(FR)) do
  begin
    El_file(FR, A);
    Vivod(FW, A);
  end;
  Close(FW);
  Close(FR);
  Writeln('****************************');
end.


