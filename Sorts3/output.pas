Program out(inp,output); {Вывод введённых входных данных на экран}

uses module;

var f: ff;
    zap: stroka;

procedure outps(zap: stroka);
  var i: integer;
  begin
    for i:=1 to zap.dlin do
      write(zap.slovo[i]);
    write(' ')
  end;

begin
  assign(f, inp);
  reset(f);
  while not(eof(f)) do begin
     read(f,zap);
     outps(zap)
  end
end.