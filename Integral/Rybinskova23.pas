{�롨�᪮�� �.�.
109 ��㯯�
3 �⠯ �ࠪ⨪㬠 #2
��宦����� ���� �ࠢ����� F(x)=0 �������஢���� ��⮤��
��宦����� ��।�������� ��⥣ࠫ� �㭪樨 F(x) � �������
���� ����ᮭ�}

Program finalIntegral (output);

uses kpro;

const g121 = 1.27;  {�࠭��� ���᪠ ����祭�� ��䨪��. ���� ��� ���� ��᫥ g - ����� ��䨪��,
                     ����� ���ᥪ�����, ��᫥���� ��� - 1 - ����� �࠭��, 2 - �ࠢ��}
      g122 = 1.28;
      g231 = 0.65;
      g232 = 0.66;
      g131 = -2.52;
      g132 = -2.53;

      eps=1E-10;
      eps1 = 0.1;
      eps2 = 1E-4;

var r1, r2, r3, S: real;

(**********************���������***ROOT*********************************)
function root(F,F1:TF; a,b:real;  eps1:real): real;
var
  i:integer;
  buf1,buf2:real;

  (*************�ਡ������� � ���� ��⮤�� ��*****************)
  function ChordM(F: TF; a,b :real):real;
  begin
    ChordM:=(a*f(b)-b*f(a))/(f(b)-f(a));
  end;
  (**************************************************************)

  (***************�ਡ������� � ���� ��⮤�� ���⥫���********)
  function TanM(F,F1:TF; x:real):real; {}
  begin
    TanM:=x-(f(x)/f1(x))
  end;
  (**************************************************************)

  (************��蠣���� �ਡ������� ����***************************)
  procedure Cycle(a,b,eps1:real);
  {var x:real;}
  begin
    while(abs(b-a)>eps1)do
    begin
      a:=ChordM(F,a,b);
      b:=TanM(F,F1,b);
      i:=i+1;
      root:=(a+b)/2;
    end
  end;
  (**************************************************************)
(******����*�㭪樨*root*****************************************)
begin
  buf1:=F((a+b)/2);
  buf2:=(F(a)+F(b))/2;
  root:=(a+b)/2;  {� ����⢥ ���� ����� ����� ���� ��� �� ��१�� [a,b],
               � ��⭮��, �।��� �⮣� ��१��}
  i:=0;
  {�. �. �ந������� ���᫥��� �������筮 ���, � ����� �����, ��
  F(A)<0, (buf1-buf2)<0, �᫨ F(a)<eps, (buf1-buf2)<eps, ��� eps - �����-�
  �祭� �����쪮� �᫮}
  if(((F(a)<eps)and(buf1-buf2<eps))or((F(a)>eps)and(buf1-buf2>eps)))
  then Cycle(a,b,eps1)
  else Cycle(b,a,eps1)
end;


(*****************�㭪�� Integral**********************************************************)
function Integral(F: TF; a,b,eps2:real):real;
const
  n0=10;   {��砫쭮� ������⢮ ࠧ������}
  p=1/15;
var n:integer;
    I1:real;  {I1 - ���祭�� In �� ��।��� ���樨}
    I2:real;  {I2 - ���祭�� I2n �� ��।��� ���樨}
    Sum:real;

  {������ ��⥣ࠫ �� ��㫥 ����ᮭ�, � I2n �� ���� ����� ����
  ��室����� ᫠����� In, ���⮬� ��� ������ �६��� �㦭� ��࠭���
  �㬬� ��� ᫠������ In � ��ࠬ��� Spred}
  (********************************************************************)
  function I(F:TF;a,b:real; var Spred:real; n:integer): real;
  var j:integer;
      h:real;
      Sodd:real; {�㬬� ᫠������ �� ������ �����}
      SEven:real; {�㬬� ᫠������ �� ���� �����}
  begin
    h:=(b-a)/n;
    SOdd:=0;
    SEven:=Spred;
    if(n=n0) {��宦����� ��⥣ࠫ� �� n=n0}
    then begin
      SEven:=0;
      for j:=1 to n-1 do
      begin
        if odd(j)
        then Sodd:=Sodd+f(a+h*j)
        else SEven:=SEven+f(a+h*j);
      end;
      Spred:=SOdd+SEven
    end
    else begin
      for j:= 1 to n div 2 do
        SOdd:=SOdd+f(a+(2*j-1)*h);
      SPred:=Sodd+SEven
    end;
    I:=(4*SOdd+2*SEven+F(a)+F(b))*(h/3);
  end;
(******************************************************************)
(*********����*�㭪樨*integral************************************)
begin
  n:=n0;
  Sum:=0;
  I1:=I(F,a,b,Sum,n); {�㫥��� 蠣 - ���祭�� ��⥣ࠫ� �� n=n0}
  n:=n*2;
  I2:=I(F,a,b,Sum,n);
  while(p*abs(I1-I2)>eps2)do
  begin
    I1:=I2;
    n:=n*2;
    I2:=I(F,a,b,Sum,n);
  end;
  Integral:=I2
end;

Begin
  writeln('��� �㭪樨');
  writeln('1. y = 2^x+1  ');
  writeln('2. y = x^5 ');
  writeln('3. y = (1-x)/3 ');
  {*****���᫥��� �祪 ����祭��**********}
  r1:=root(f12, f112, g121, g122, eps1);
  writeln('������ �窨 ����祭�� ��䨪�� ��ࢮ� � ��ன �㭪樨: ', r1:10:6);
  r3:=root(f23, f123, g231, g232, eps1);
  writeln('������ �窨 ����祭�� ��䨪�� ���쥩 � ��ன �㭪樨: ', r3:10:6);
  r2:=root(f13, f112, g131, g132, eps1);
  writeln('������ �窨 ����祭�� ��䨪�� ��ࢮ� � ���쥩 �㭪樨: ', r2:10:6);
  {*******************************************}
  S:=integral(f1, r2, r1, eps2)-integral(f2, r3, r1, eps2)-integral(f3, r2, r3, eps2);
  writeln('���頤� 䨣���, ��ࠧ������� �窠�� ����祭�� ��䨪�� �㭪権: ', S:10:6)
end.

