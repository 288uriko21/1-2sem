Program n1;
uses module, crt;


Procedure generationNumber(var mas: massiv; col: integer;var numb8: shortint; var numb16: integer; var numb32: longint);
var i: byte;
begin
  for i:=1 to col do begin
    mas[i] := random(2);
    if mas[i]=1 then
       postanovka(numb8, numb16, numb32, col-i);
  end
end;

var mas: massiv;
    numb8: shortint;
    numb16: integer;
    numb32: longint;
    i: integer;
    c: char;
begin
  c := readkey;
  write(ord(c))
end.



