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
   write('������ ��ࢮ� �᫮:  ');
   readln(A);
   write('������ ��஥ �᫮:  ');
   readln(B);
   SUM(A, B, C1, C, Cf, OFf);
   if CF = True then
      writeln('������� ����७ ��� ����������� �ᥫ')
   else begin
      write('���������� १����:  ');
      writeln(C)
   end;
   writeln;
   if OFf = True then
      writeln('������� ����७ ��� �������� �ᥫ')
   else begin
      write('������� १����:  ');
      writeln(C1)
   end
end.



