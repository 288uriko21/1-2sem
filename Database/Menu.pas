Program readd(filename, output);

uses module;

const filename = 'T3.test';

var f: ff;
    menu{��६�����, ���������� �㭪� ����}, col{������⢮ ��஡�� ���⨫�}, m, m1{��६���� ���
    ���뢠��� ࠧ����� ������ �� �믮������ ������ �� �㭪⮢ ����},res{�⮨����� �� �.4}: integer;
    mas: pas;{���ᨢ ��஡��}

begin
   assign(f, filename);
   reset(f);
   col:=1;

   while not(eof(f)) do begin
        read(f, mas[col]);
        col:=col+1
   end;

   menu:=1;
   while menu<>6 do begin
      writeln('����');
      writeln('1. �뢥�� �� �࠭ ����� � ��� ��஡���');
      writeln('2. �뢥�� ����� ��஡�� ���⨫�, �� ����� ���� ᪨��� � �������� �����');
      writeln('3. ��।����� ᠬ� 㤠�� ����� ��� ���㯪� ���⨫�');
      writeln('4. �뢥�� �⮨����� ᠬ�� ���񢮩 ��஡��, � ���ன �� ����� �����ண� ������⢠ 㯠����� ��������� ����');
      writeln('5. �뢥�� ����� ���襩 �� ३⨭�� ��஡��, ������ ����� �ਮ���� � ����� ������ �� �������� �㬬�');
      writeln('6. ��������');
      readln(menu);
      case menu of
        1: readbox(f);
        2: begin
            writeln('������ ����� �����');
            readln(m);
            outpMonthSale(col, cchr(m), mas);
           end;
        3: UdMonth(mas, col);
        4: begin
              writeln('������ ����');
              printTaste;
              readln(m);
              writeln('������ ������⢮');
              readln(m1);
              res:=SumCost(mas, m1, col, m);
              if res<>maxInt then
                    writeln(res)
              else
                    writeln('��� ���室��� ��஡��')
           end;
        5:begin
            writeln('������ �������� �㬬�');
            readln(m);
            five(mas, col, m);
          end;
        6: ;
      end;
      writeln;
   end

end.









