Program vvod(outp); {�ணࠬ�� ����� �������� ᫮� �� �室��� 䠩� ��� ���஢��}

uses module;

var f: file of stroka;

procedure input(var f: ff);

var   i, j, dlin: integer; zap: stroka; c: char;

begin
  rewrite(f);
  writeln('������ ���-�� ������, ����� ᮡ�ࠥ��� �����');
  readln(dlin);
  write('������ ᫮�� ������ �� 10 �����⥫쭮, �१ �஡��(�஡�� ��᫥ ��᫥����� ᫮�� ⮦� ������, ��������): ');
  for i:=1 to dlin do begin
    read(c);
    zap.dlin:=1;
    while c <> ' ' do begin
      zap.slovo[zap.dlin]:=c;
      zap.dlin:=zap.dlin+1;
      read(c)
    end;
    zap.dlin:=zap.dlin-1;
    write(f, zap);
    zapSpace(zap, ' ');
  end;
  close(f);
end;

begin
   assign(f, inp);
   input(f)
end.





