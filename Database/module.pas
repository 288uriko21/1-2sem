unit module;

{!��஡�� � 㯠����� � ������ �ணࠬ�� �� ����� ᨭ�������, � ������ ��஡�� ᮤ�ন��� �����஥ ������⢮ 㯠�����!}
interface
const N = 60; {������⢮ �㪢 � �������� ���}
      N2 = 30; {���ᨬ��쭮�����⨬�� ������⢮ 㯠�����}
type
     fir =  packed array[1..N] of char;
     T = array[1..N2] of integer;
     month = (jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
     sales = set of month;

     pastila = record   {⨯ ��஡�� ���⨫�}
               avaliable, delivery: boolean;{������⥫� ����㯭��� ��� ������ � ���������� ���⠢��
                                             ᮮ⢥��⢥���}
               sale: sales;{������⢮ ����楢, � ����� �� ��஡�� �।��⠢����� ᪨���}
               taste: T;{���ᨢ ���ᮢ (������ - ����� 㯠�����, ���祭�� - ���, ���������� ����)}
               firm: fir;{�������� ���}
               rate, count, price: integer{३⨭�(楫�� �᫮ �� 1 �� 5), ������⢮
                                           㯠�����, 業� ᮮ⢥��⢥���}
     end;

     ff = file of pastila;
     pas = array[1..N] of pastila;

procedure printTaste;
function SumCost(m: pas; n, col, el: integer): integer;
function cchr(n: integer): month;
procedure readbox(var f: ff);
procedure outpMonthSale(col: integer; m: month; var a: pas);
procedure UdMonth(m: pas; col: integer);
procedure readpastil(var el: pastila);
Procedure five(a: pas; col, sum: integer);

implementation

{//////////������ ������ ������/////////////////////////////////////////////////////////}
(***************************************************************************************)
procedure printTaste;
begin
  writeln('1. ������᪠�');
  writeln('2. �����');
  writeln('3. ��୨筠�');
  writeln('4. � �୮� ᬮத����');
  writeln('5. � ������宩');
  writeln('6. ��㡭�筠�');
  writeln('7. ���������');
  writeln('8. � ����');
  writeln('9. � ���楩');
  writeln('10. �����筠�');
  writeln('11. ����ﭨ筠�');
  writeln('12. � ���᭨���');
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)


{//////////������ �������� ������///////////////////////////////////////////////////////}
(***************************************************************************************)
procedure writemonth(i: month);
begin
  case i of
           jan: write('ﭢ���');
           feb: write('䥢ࠫ�');
           mar: write('����');
           apr: write('��५�');
           may: write('���');
           jun: write('���');
           jul: write('���');
           aug: write('������');
           sep: write('ᥭ����');
           oct: write('������');
           nov: write('�����');
           dec: write('�������');
         end
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)


{//////////////////��楤�� ��� �.5 ����///////////////////////////////////////////////}
(***************************************************************************************)
Procedure five(a: pas; col, sum: integer);
var r, i, res: integer;
begin
  i:=1;
  r:=0;
  while i<=col do begin
     if (a[i].avaliable) and (a[i].price<=sum) and (a[i].rate>r) then begin
         r:=a[i].rate;
         res:=i;
     end;
     i:=1+i;
  end;
  if r=0 then
     write('��� ����������� �㯨�� ��஡�� ���⨫� �� ��� �㬬�((')
  else
     write('��஡�� �', res);
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)


{///////////////������� ��� ������ 4 ����///////////////////////////////////////////////}
(***************************************************************************************)
function SumCost(m: pas; n, col, el: integer): integer;
var i,c: integer;

(***********������ ���������� �������� ������� � �������� ������ � ������� ************)
function count(var a: T; el{����}: integer): integer;
var i,c: integer;
    flag: boolean;
begin
  i:=1;
  c:=0;{������⥫� count}
  flag:= true;
  while (a[i]<>0) and flag do begin
     if a[i] = el then begin
       c:=c+1;
      // write(' *',i,'* ')
     end;
     i:=i+1;
    // write(a[i],'-');
     if i = N2 then begin
        flag:=false;
        i:=N2-1;
     end
  end;
 // write('************************');
  count:=c
end;
(***************************************************************************************)

begin
  i:=1;
  c:=maxInt;{�.� 業� ���⨫� �� 15000}
  while i<=col do begin
      if (count(m[i].taste, el)>=n) and (m[i].price<c) then
         c:=m[i].price;
      i:=i+1
  end;
  SumCost:=c;
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)


{////////////////��������� ��� �.3 ����/////////////////////////////////////////////////}
(***************************************************************************************)
procedure UdMonth(m: pas; col: integer);
var a: array[jan..dec] of integer;
    i: integer;
    j, res: month;
begin
  for j:=jan to dec do
      a[j]:=0;
  for j:=jan to dec do
      for i:=1 to col do
          if j in m[i].sale then
             a[j]:=a[j]+1;
  i:=0;
  res:= jan;
  for j:=jan to dec do
      if a[j]>i then begin
         i:=a[j];
         res:=j
      end;
  writemonth(res)
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)

{////////////////��������� ��� ������ 2 ����//////////////////////////////////////////////}
(***************************************************************************************)
procedure outpMonthSale(col: integer; m: month; var a: pas);
var i: integer;
    estskid: boolean;
begin
  i:=1;
  estskid:=false;
  while i<=col do begin
      if m in a[i].sale then begin
         writeln('��஡�� �', i);
         estskid:=true;
      end;
      i:=i+1
  end;
  if not(estskid) then
     writeln('� �������� ����� ��� ᪨���');
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)

{////////������//�������/CHR//���//�������//////////////////////////////////////////////}
(***************************************************************************************)
function cchr(n: integer): month;
   var m: month;
  begin
   m:= jan;
   while ord(m)<>n-1 do
        m:=succ(m);
   cchr:=m;
  end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)

{//////////����������//����������///�������/////////////////////////////////////////////}
(***************************************************************************************)
procedure readpastil(var el: pastila);
var
  t: integer;
(*************����**��������**�����*****************************************************)
   procedure inputfirm(var f: fir);
  var i: integer;
      c: char;
  begin
    read(c);
    i:=1;
    while c<>'.' do begin
       f[i]:=c;
       i:=i+1;
       read(c)
    end;
    while i<>N+1 do begin
       f[i]:=' ';
       i:=i+1
    end
  end;
(***************************************************************************************)

begin
  writeln('������ ����� � ��஡�� ���⨫�');
  writeln('������ �������� ���, ������� ���� �窮�');
  inputfirm(el.firm);
  writeln('������ 業� � �㡫�� (楫�� �᫮)(�� 15000 �㡫��) ');
  readln(el.price);
  writeln('������ 1, �᫨ ���⨫� ����㯭� ��� ������ � 0, �᫨ ���');
  readln(t);
  if t=1 then
     el.avaliable:=true
  else
     el.avaliable:=false;
  writeln('������ 1, �᫨ ���� ����������� ���⠢�� �� ��� � 0, �᫨ ���');
  readln(t);
  if t=1 then
     el.delivery:=true
  else
     el.delivery:=false;
  writeln('������ ����� ����楢, � ������ �� ���⨫� ���� ᪨���, ������� ���� �᫮� 0 �१ �஡��');
  el.sale:=[];
  read(t);
  while t<>0 do begin
        el.sale:=el.sale+[cchr(t)];
        read(t);
  end;
  writeln('������ ३⨭ ���⨫� (楫�� �᫮ �� 1 �� 5)');
  readln(el.rate);
  writeln('������ ������⢮ 㯠����� ���⨫� � ��஡��');
  readln(el.count);
  writeln('������ ��᫥����⥫쭮��� ���, ᮮ⢥�������� ���ᠬ 㯠����� ���⨫�^^');
  printTaste;
  for t:=1 to el.count do
     read(el.taste[t]);
  for t:=el.count+1 to N2 do
     el.taste[t]:=0
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)

{///////////////////////////////////////////////////////////////////////////////////////}
(*************�������**����������**(��� �.1 �� ����)************************************)
procedure readbox(var f: ff);
var i, j: integer;
       p: pastila;

(********������ �������, �� ������� ������� �� �������**********************************)
procedure sales(s: sales);
var i: month;
    flag: boolean;
begin
  flag:=false;
  write('������ �� ���⨫� �� ����栬: ');
  for i:=jan to dec do begin
      if i in s then begin
         if flag then
            write(', ');
         flag:=true;
         writemonth(i)
      end
  end;
  if flag = false then
     write('-');
end;
(***************************************************************************************)

(**********������ ������****************************************************************)
procedure tastes(p: pastila);
var i: integer;
begin
  writeln('����� �� 㯠������ ᮮ⢥��⢥���: ');
  for i:=1 to p.count do begin
     case p.taste[i] of
        1: write('������᪠�');
        2: write('�����');
        3: write('�୨筠�');
        4: write('� �୮� ᬮத����');
        5: write('� ������宩');
        6: write('��㡭�筠�');
        7: write('���������');
        8: write('� ����');
        9: write('� ���楩');
        10: write('�����筠�');
        11: write('����ﭨ筠�');
        12: write('� ���᭨���');
     end;
     if i<>p.count then
        write(', ')
  end;
  writeln;
end;
(***************************************************************************************)

begin
  reset(f);
  i:=1;
  while not(eof(f)) do begin
       read(f,p);
       writeln;
       if i<>1 then begin
         writeln('///////////////////////////////////////////////////');
         writeln;
         writeln
       end;
       writeln('���ଠ�� � ��஡�� ���⨫� �', i);
       writeln;
       writeln('��ଠ: ', p.firm);
       writeln;
       writeln('����: ', p.price);
       writeln;
       if p.avaliable = true then
          writeln('����㯭� ��� ������')
       else
          writeln('�� ����㯭� ��� ������');
       writeln;
       if p.delivery = true then
          writeln('��������� ����������� ���⠢�� �� ���')
       else
          writeln('��� ���������� ���⠢�� �� ���');
       writeln;
       writeln('������⢮ ��஡��: ', p.count);
       writeln;
       write('���⨭� ���⨫�: ');
       for j:=1 to p.rate do
           write('* ');
       writeln;
       writeln;
       tastes(p);
       writeln;
       sales(p.sale);
       i:=i+1;
       writeln
  end
end;
{///////////////////////////////////////////////////////////////////////////////////////}
(***************************************************************************************)

end.








