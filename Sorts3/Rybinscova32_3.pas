{�롨�᪮�� �.�.
109 ��㯯�
2 �⠯ �ࠪ⨪㬠 #3
����஢�� �� �����⠭��
�����筠� ���஢�� � ���஢�� ��⮤�� ����⢥����� ᫨ﭨ�
�室 - ⨯���஢���� 䠩�, ��室 - ⥪�⮢� 䠩�}

Program chisla(inp, outp);

uses module;

const elemCount = 30;
      outp = 'outp.txt';

type massiv = array [1..elemCount] of stroka;

var perest, dlin, sravn, i: integer;
    a, a1, y: massiv;
    f:  ff;
    fo: text;

{////�뢮�//���ᨢ�//᫮�////////////////////////////////////////}
procedure vivod(var m: massiv);

procedure outps(zap: stroka);
  var i: integer;
  begin
    for i:=1 to zap.dlin do
      write(fo,zap.slovo[i]);
    write(fo,' ')
  end;

begin
   for i:=1 to dlin do begin
       outps(m[i]);
   end;
   writeln(fo);
end;
{///////////////////////////////////////////////////}


{//////////////////////////////////////////////////////////////////////////////////}
{***********����⢥����*᫨ﭨ�******************************************}
procedure SORTH(var m, y: massiv; var p, s: integer);

{**********�㭪��,**�஢������**�����஢�������**���ᨢ�********************}
function issorted (m: massiv; var s: integer):boolean;
var i: integer; flag: boolean;
begin
  flag:=false;
  issorted:=true;
  i:=1;
  while (i<=dlin-1) and (not(flag)) do  begin
      if srav(m[i],m[i+1],false) then begin
        issorted:=false;
        flag:=true
      end;
      s:=s+1;
      i:=i+1;
  end
end;

procedure estslian(var m, y: massiv; var p, s: integer);
var n, k, i, z, z1, nachy1, nachy2, beg, en: integer; flag, f: boolean; zap: stroka;

{*****************����**�ࠢ���**����**��१��**�**��砫�**���ᨢ�**�������饣�**᫨ﭨ�*******}
function poiskk(var m: massiv; nach: integer): integer;
var i: integer;
    flag: boolean;
begin
  i:=nach;
  flag:=true;
  while flag do  begin
    i:=i+1;
    s:=s+1;
    if i>=dlin then
       flag:=false;
    if flag then
      if not(srav(m[i+1],m[i], true)) then
         flag:=false
  end;
  poiskk:=i
end;
{***************************************************************************************}

{**********����**������**����**��१��**�**����**���ᨢ�**�������饣�**᫨ﭨ�*******}
function poiskn(var m: massiv; nach: integer): integer;
var i: integer;
    flag: boolean;
begin
  i:=nach;
  flag:=true;
  while flag do begin
    i:=i-1;
    s:=s+1;
    if i<=1 then
       flag:=false;
    if flag then
       if not(srav(m[i],m[i-1], true)) then
          flag:=false
  end;
  poiskn:=i
end;
{************************************************}

 begin
  flag:=true;
  f:=true;
  nachy1:=1;
  nachy2:=dlin;
  beg:=1;
  en:=dlin;
  zapSpace(zap, '-');
  k:=poiskk(m,beg);
  n:=poiskn(m, en);
  {write(fo,'kn', k, ' ', n, 'beg en', beg,' ', en);}
  if k<>en then begin
   for i:=1 to dlin do
      y[i]:=zap;
   while en>=beg do begin {�᫮��� "���� �� �����襭� ��७�ᥭ�� � Y"}
     k:=poiskk(m,beg);
     n:=poiskn(m, en);
     z:=n;
     z1:=k;
     if n=beg then
       n:=en+1;
     if f then begin {�᫨ �����뢠�� � ��砫� Y}
      while (n<>en+1) or (k<>beg-1) do begin {�᫮��� ����砭�� ᫨ﭨ� ��१��� � ���� � ��砫�}
        if (((n<>en+1) and (beg-1<>k)) and srav(m[beg],m[n],false)) or
        ((n<>en+1) and (beg-1=k)) then begin {�᫮���, �� ���஬ � Y �����뢠���� ������� �� ��१�� � ���� X}
            y[nachy1]:=m[n];
            n:=n+1;
            if beg-1<>k then
               s:=s+1;
            p:=p+1;
            nachy1:=nachy1+1
        end
        else begin
            if beg-1<>k then
               s:=s+1;
            p:=p+1;
            y[nachy1]:=m[beg];
            beg:=beg+1;
            nachy1:=nachy1+1
        end;
      end
     end
     else begin
      while (n<>en+1) or (k<>beg-1) do begin
        if (((n<>en+1) and (beg-1<>k)) and srav(m[k],m[en], false)) or
        ((z1<>beg-1) and (en+1=n)) then begin
            y[nachy2]:=m[k];
            k:=k-1;
            p:=p+1;
            if beg-1<>k then
               s:=s+1;
            nachy2:=nachy2-1
        end
        else begin
            y[nachy2]:=m[en];
            en:=en-1;
            p:=p+1;
            if beg-1<>k then
               s:=s+1;
            nachy2:=nachy2-1
        end
      end;
     end;
     if f then
        en:=z-1
     else
        beg:=z1+1;
     f:=not(f);
   end;
   estslian(y, m, p, s)
  end
 end;
begin
 if not(issorted(m,s)) then begin
    estslian(m,y,perest,sravn);
    if issorted(y,s) then
       m:=y
 end
end;
{////�����//���ᢥ�����//᫨ﭨ�///////////////////////////////////////////////////////}

{////////////////�����筠�//���஢��/////////////////////////////////////////}
procedure chelnoch(var m: massiv; var p, s: integer; dlin: integer);
 procedure swap(var a, b: stroka);
 var c: stroka;
 begin
   c:=a;
   a:=b;
   b:=c
 end;
var i, j, n: integer;
    flag: boolean;
begin
  for i:=2 to dlin do begin
      s:=s+1;
      if srav(m[i-1],m[i],false) then begin
         swap(m[i],m[i-1]);
         p:=p+1;
         flag:=true;
         n:=i-2;
         j:=i-1;
         while (n>0) and flag do begin
             n:=n-1;
             s:=s+1;
             if (srav(m[j-1],m[j],false)) then begin
                swap(m[j],m[j-1]);
                p:=p+1
             end
             else
                flag:=false;
             j:=j-1
         end
      end
  end
end;
{///////////////////�����//祫��筮�//���஢��////////////////////////////////////////}

begin
   assign(f, inp);
   reset(f);
   assign(fo, outp);
   rewrite(fo);
   dlin:=0;
   while not(eof(f)) do begin
      dlin:=dlin+1;
      read(f,a[dlin])
   end;
   a1:=a;
   write(fo,'��砫�� ���ᨢ: ');
   vivod(a);
   writeln(fo);
   writeln(fo);
   writeln(fo,'�����筠� ���஢��');
   for i:=1 to dlin do begin
      zapSpace(y[i],'-');
      y[i].dlin:=1;
   end;

   chelnoch(a, perest, sravn, dlin);
   write (fo,'�⮣��� ���ᨢ: ');
   vivod(a);
   writeln(fo);
   writeln(fo,'����⠭���� - ',perest,' �ࠢ����� - ', sravn);

   writeln(fo);
   writeln(fo);
   writeln(fo,'����஢�� ����⢥��� ᫨ﭨ��');
   perest:=0;
   sravn:=0;
   SORTH(a1, y, perest, sravn);
   write(fo,'�⮣��� ���ᨢ: ');
   vivod(a1);
   writeln(fo);
   writeln(fo,'����⠭���� - ',perest,' �ࠢ����� - ', sravn);
   close(fo)
end.
