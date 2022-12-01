Unit module_ang;
{
   ��ᯠ��� ��������
   109 ��㯯�
   �ࠪ⨪� �1 "����䥩�"
   ����� ࠡ��� � ��⮬
}
interface
Uses CRT,module;

//�-� �����頥� True, �᫨ ���� �ࠢ����, ����-false
function Vvod_chisla(col: integer;var numb8: shortint;var numb16:integer;var numb32: longint):boolean;

//�-�, �����頥� ����� ᤢ���, ⠪�� ����� �室��� �᫮ �� ᤢ���
//ᮧ���� ���ᨢ
function generationSdvig(var CF, SF, ZF, oOF: integer;var numb8:shortint;var numb16:integer;var numb32: longint; col: integer;var mas: massiv; var kolvo:integer):Integer;

procedure sdvig(var CF, SF, ZF, oOF: integer;var numb8:shortint;var numb16:integer;var numb32: longint; col: integer;var mas: massiv; sdv:integer);

procedure skleika_v_longint(var OP1:Longint; c:Longint);
  pascal;
  external name '_skleika_v_longint@0';
  {$L a11.obj}

implementation


{�-� �����頥� True, �᫨ ���� �ࠢ����, ����-false}
function Vvod_chisla(col: integer;var numb8: shortint;var numb16:integer;var numb32: longint):boolean;
 function Vvod_chisla_longint(var L: longint):boolean;
 var c:char;
    TF: Integer=0;{TF=2, �᫨ ������� ���ࠢ��쭮� �᫮}
	str: string='4294967296';
	k:Integer=0;
	A,last:Longint;
 Begin
  A:=0;
  last:=1;
  Repeat
    c:=readkey;
    if (c>='0')and(c<='9') then
    begin
      k:=k+1;
      write(c);
      if (TF=0)and(c>str[k]) then
        TF:=2;
      if (TF=0)and(c<str[k]) then
        TF:=3;
      if k>=10 then {���뢠�� ��᫥���� ����}
        last:=ord(c)-ord('0')
      else
        A:=A*10+ord(c)-ord('0');
    end
  Until (ord(c)=Quitchar)or(ord(c)=Lastchar);
  skleika_v_longint(A,last);
  if (((TF=0)or(TF=2))and(k=10))or(k>10) then begin Writeln(TF); Vvod_chisla_longint:=False end
  else if k=10 then begin
    Vvod_chisla_longint:=True;
  end
  else Vvod_chisla_longint:=true;
  L:=A;
 end;

var TF:boolean=True;
    c:char;
Begin
  numb16:=0;numb8:=0;numb32:=0;
  if col=32 then TF:=Vvod_chisla_longint(numb32)
  else
  begin
    Repeat
      c:=readkey;
      if (c>='0')and(c<='9') then
      begin
        write(c);
        if col=8 then begin
          numb16:=numb16*10+ord(c)-ord('0');
          if numb16>=256 then TF:=False;
        end
        else begin
          numb32:=numb32*10+ord(c)-ord('0');
          if numb32>=65536 then TF:=False;
        end;
      end;
    Until (ord(c)=Quitchar)or(ord(c)=Lastchar);
	if col=8 then numb8:=numb16;
	if col=16 then numb16:=numb32;
    Vvod_chisla:=TF;
  end;
end;

procedure generationNumber(var numb8: shortint; var numb16: integer; var numb32: longint; col: integer; var mas: massiv);
var i: byte;
begin
  for i:=1 to col do begin
    mas[i] := random(2);
    if mas[i]=1 then
       postanovka(numb8, numb16, numb32, col-i);
  end
end;
procedure sdvig(var CF, SF, ZF, oOF: integer;var numb8:shortint;var numb16:integer;var numb32: longint; col: integer;var mas: massiv; sdv:integer);
Begin
  case sdv of
  1: shll(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  2: shlr(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  3: sar(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  4: rol(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  5: ror(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  6: rcl(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  7: rcr(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas);
  end;
end;
{�-�, �����頥� ����� ᤢ���, ⠪�� ����� �室��� �᫮ �� ᤢ���
  ⠪�� ������ �᫮ ᤢ����
  ᮧ���� ���ᨢ}
function generationSdvig(var CF,SF,ZF,oOF: integer;var numb8:shortint;var numb16:integer;var numb32: longint; col: integer;var mas: massiv; var kolvo:integer):Integer;
var sdv:Integer;
    i:integer;
Begin
  kolvo:=random(3)+1;
  numb16:=0;numb8:=0;numb32:=0;
  generationNumber(numb8,numb16,numb32,col,mas);
  sdv:=random(7)+1;
  for i:=1 to kolvo do sdvig(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas,sdv);
  generationSdvig:=sdv;
end;
Begin
  Randomize
end.

var A,B: Longint;
    c:char;
    CF, SF, ZF, oOF: integer;
    numb8: shortint;
    numb16: integer;
    numb32: longint;
    col: integer=8;
    kolvo: integer=2;
    mas: massiv;
    i:Integer;
Begin
  Randomize;
  clrscr;
  {print('������ �᫮:');writeln;
  if not Vvod_chisla(col,numb8,numb16,numb32) then
    Writeln('Wrong')
  else begin
    writeln;
    Writeln(numb8);
  end;}
  numb16:=0;numb8:=0;numb32:=0;
  generationNumber(numb8,numb16,numb32,col,mas);
  writeln(numb8);
  generationSdvig(CF,SF,ZF,oOF,numb8,numb16,numb32,col,mas,kolvo);
  writeln('CF=',CF);
  for i:=1 to col do
  begin
   write(mas[i]);
  end;
  Writeln;
  case col of
  8: Writeln(numb8);
  16: Writeln(numb16);
  32: Writeln(numb32);
  end;
  c:=readkey;
end.
