Program A5;

var
   A, B: integer;
   C1: integer;
   C: word;
   CF, OFf: boolean;

   Procedure SUM(A, B: integer; var C1: integer; var C: word; var CF, OFf: boolean);
   stdcall;
   external name '_SUM@0';
   {$L Angelina.obj}

begin
   CF:=FALSE;
   OFf:=FALSE;
   write('Введите первое число:  ');
   readln(A);
   write('Введите второе число:  ');
   readln(B);
   SUM(A, B, C1, C, Cf, OFf);
   if CF = True then
      writeln('Результат неверен для беззнаковых чисел')
   else begin
      write('Беззнаковый результат:  ');
      writeln(C)
   end;
   writeln;
   if OFf = True then
      writeln('Результат неверен для знаковых чисел')
   else begin
      write('Знаковый результат:  ');
      writeln(C1)
   end
end.



