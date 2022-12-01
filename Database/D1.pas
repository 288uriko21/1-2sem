Program inp(input, filename);

uses module;

const filename = 'data.dat';
var f: ff;
    i: integer;
    el: pastila;




begin
   assign(f, filename);
   rewrite(f);
   writeln('Введите количество коробок пастилы');
   readln(i);
   while i>0 do begin
     i:=i-1;
     readpastil(el);
     write(f, el)
   end;
   close(f);
end.












