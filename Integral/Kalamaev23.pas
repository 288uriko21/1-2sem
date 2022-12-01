{Kalamaev 109
��⨩ �⠯ ��ண� ������� �� �ࠪ⨪�� �� ���
��襭�� �ࠢ����� ��⮤�� ���⥫���. �������ୠ� ��㫠 - ���頤� �࠯�権
��宦����� ���頤� �ਢ���������� ��㣮�쭨��}
program task23(input, output);
const
  epsur = 0.00000001;
  eps1 = 0.0000001; {����⠭�� ��� ���� �ࠢ�����}
  eps2 = 0.0000001; {����⠭� ��� ��⥣ࠫ�}
  eps = 0.000001;
  start12 = -0.5;
  start13 = -4.25;
  start23 = -2;
  fin12 = -0.2;
  fin13 = -3.75;
  fin23 = -1.5;
var
  d: real;
  abob, numb1, numb2: integer;
  ans12, ans13, ans23: real; {��୨ �ࠢ�����}
  Int1, Int2, Int3: real; {���祭�� ��⥣ࠫ��}
{�㭪樨, ������騥 ���祭�� �㭪権 � �窥 d}
function fun(nom:integer; d:real): real;
  begin
    case nom of
      1: fun := exp(d) + 2;
      2: fun := -1/d;
      3: fun := (-2/3)*(d+1);
  end;
end;
{�㭪樨, ������騥 ���祭�� �ந�������}
function pr(nom:integer; d:real): real;
  begin
    case nom of
      1: pr:=exp(d);
      2: pr:=1/sqr(d);
      3: pr:=-2/3
    end;
  end;
{��楤�� root, � ���ன �� ����塞 ��७� F(x)=0,
��� F(x) ���� ࠧ������ ���� ��࠭��� ���� �㭪権.}
procedure root(n1, n2: integer; var d: real; a, b: real);
  var ch1, ch2: real;
    c: integer; {c - ����稪 ������⢠ ���権}
	abob: integer; {��६����� ����室���� ��� ������ ��ਠ��}
  function F(d: real): real; {���� ࠧ���� �㭪権}
    begin
      F := fun(n1, d) - fun(n2, d)
    end;
  function P(d: real):real; {���� ࠧ���� �ந�������}
    begin
      P:=pr(n1, d)-pr(n2, d)
    end;
  begin
    ch1:=F((a+b)/2);
    ch2:=(F(a)+F(b))/2;
    c:=0;
    {����� ���� �஢���� �믮������ ���� �᫮���:
    1. �����⠭��/�뢠��� (F(a)<0 - �����⠥�)
    2. ��� �� ��䨪 �㭪樨 ��� ��� ��� (ch1>ch2-���)
    ����� �����⠭�� - true; ��䨪 ���� ��� - false}
    if (f(a)<epsur) <> (ch1-ch2<epsur) then begin
      d:=b;
      while f(d-eps1)*f(d)>epsur do begin
        d:=d-f(d)/p(d);
        c:=c+1;
        {writeln(c,'. ', d:9:6) �ᯮ�짮������ � ������� 2}
      end;
    end
    else begin
      d:=a;
      while f(d+eps1)*f(d)>epsur do begin
        d:=d-f(d)/p(d);
        c:=c+1;
        {writeln(c,'. ',d:9:6) �ᯮ�짮������ � ������� 2}
      end;
    end;
    abob:=n1+n2;
    case (abob mod 3) of
      0: ans12:=d;
      1: ans13:=d;
      2: ans23:=d;
    end;
  end;
{����� �㭪��, �������� ���祭�� ��⥣ࠫ� �㭪樨 �� ��������
��१��. ���᫥��� ��室�� ��⮤�� �࠯�権 � � �ਬ������� �ࠢ��� �㭣�}
Function Integral(nom: integer; a, b: real): real;
  const
    p = 1/3;
  var
    I1, I2, check, h: real;
    iter, n: longint;
  function result(i: integer): real;
    begin
      result:=Fun(nom, (a+i*h));
      {writeln(result);}
    end;
  begin
    n:=2;
    h:=(b-a)/n;
    I2:=0.5*result(0)+result(1)+0.5*result(2);
    {�� ��㫥 �࠯�権 � 0 � n-�� ��१��� ������� 㬭������ �� 0.5}
    check:=h*I2;
    repeat
      I1:=check;
      n:=n*2;
      h:=(b-a)/n;
      for iter:=0 to n do
        if odd(iter) then
	  I2:=I2+result(iter);
      check:=h*I2;
      {writeln(I1:10:7, ' ', check:10:7, ' ', abs(I1-check):10:7);
      �஢��� �⨬ �����஬ �뢮�� �ࠢ��쭮��� ����}
    until p*abs(I1-check)<eps2; {����㥬�� �ࠢ���� �㭣�, �஢���� ���頤� ��⥣ࠫ�}
    Integral:=check
  end;
{�㭪�� ���᫥��� ���頤� 䨣���}
{Function Square(): real;}

{--------------------------------------------------------}
begin
  writeln('���� �� �㭪樨, ��୨ ������ ᥩ�� ���� ��室�����');
  writeln('1. f(x)=e^x+2');
  writeln('2. f(x)=-1/x');
  writeln('3. f(x)=(-2/3)*(x+1)');
  writeln('��⠥� ��୨!');
  root(1, 2, d, start12, fin12);
  writeln('��襭�� ��ࢮ�� � ��ண� �ࠢ�����: ',ans12:10:7);
  root(1, 3, d, start13, fin13);
  writeln('��襭�� ��ࢮ�� � ���쥣� �ࠢ�����: ',ans13:10:7);
  root(2, 3, d, start23, fin23);
  writeln('��襭�� ��ண� � ���쥣� �ࠢ�����: ',ans23:10:7);
  writeln('��⠥� ��⥣ࠫ� �� ��訬 �������� ����.');
  Int1:=Integral(1, ans13, ans12);
  writeln('���� ��⥣ࠫ ࠢ�� ', Int1:10:7);
  Int2:=Integral(2, ans23, ans12);
  writeln('��ன ��⥣ࠫ ࠢ�� ', Int2:10:7);
  Int3:=Integral(3, ans13, ans23);
  writeln('��⨩ ��⥣ࠫ ࠢ�� ', Int3:10:7);
  writeln('����� ���頤� �ਢ���������� ��㣮�쭨��!');
  writeln('��� �⢥� � �筮���� eps =', eps:9:6, ': ', (Int1-Int2-Int3):10:7)
  {�������, � ��� ����ࠢ��� ��⥣ࠫ - ���!}
end.
{eps=eps1 ��� ��୥� ࠢ�� 0.000000001;
�筮� ���祭�� 1 � 2 �ࠢ�����: -0.371819245
�筮� ���祭�� 1 � 3 �ࠢ�����: -4.026748330
�筮� ���祭�� 2 � 3 �ࠢ�����: -1.822875656
1
3
1. -4.026185
2. -4.026748
1
2
1. -0.321265
2. -0.364491
3. -0.371663
4. -0.371819
(��� eps = eps1 = 0.1 1. -0.321265   2. -0.364491)
3
2
1. -1.818182
2. -1.822872

��⥣ࠫ�: 1 - ����� �-樨
������ ��砫�� � ������ ���祭�� ��१�� (eps2=0.00001)
-4
-0.27
 8.2050672 (ᮢ������ � ��� ���祭��� ��⥣ࠫ� �� �⮬ ��१��)
2
-1.82
-0.27
 1.9081724
3
1
6
-15.0000000
}
