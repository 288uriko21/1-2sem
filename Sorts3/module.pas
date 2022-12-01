unit module;

interface

const letters = 10;
      inp = 'T5.slov';

type mas = packed array[1..letters] of char;
      stroka = record
              dlin: integer;
              slovo: mas;
      end;
      ff = file of stroka;

function ord(c:char): integer;
procedure zapSpace(var zap: stroka; let: char);
function srav(var z1, z2: stroka; r: boolean): boolean;

implementation

 procedure zapSpace(var zap: stroka; let: char);
 begin
    zap.slovo[1]:=let;
    zap.dlin:=1;
 end;

 function ord(c:char): integer; {ord ��� ���᪨� �㪢 (����� �뫮 ᤥ���� ���ᨢ��)}
    begin
       case c of
           '�': ord:=1;
           '�': ord:=3;
           '�': ord:=5;
           '�': ord:=7;
           '�': ord:=9;
           '�': ord:=11;
           '�': ord:=13;
           '�': ord:=15;
           '�': ord:=17;
           '�': ord:=19;
           '�': ord:=21;
           '�': ord:=23;
           '�': ord:=25;
           '�': ord:=27;
           '�': ord:=29;
           '�': ord:=31;
           '�': ord:=33;
           '�': ord:=35;
           '�': ord:=37;
           '�': ord:=39;
           '�': ord:=41;
           '�': ord:=43;
           '�': ord:=45;
           '�': ord:=47;
           '�': ord:=49;
           '�': ord:=51;
           '�': ord:=53;
           '�': ord:=55;
           '�': ord:=57;
           '�': ord:=59;
           '�': ord:=61;
           '�': ord:=63;
          '�':  ord:=65;
          '�':  ord:=2;
          '�':  ord:=4;
          '�':  ord:=6;
          '�':  ord:=8;
          '�':  ord:=10;
          '�':  ord:=12;
          '�':  ord:=14;
          '�':  ord:=16;
          '�':  ord:=18;
          '�':  ord:=20;
          '�':  ord:=22;
          '�':  ord:=24;
          '�':  ord:=26;
          '�':  ord:=28;
          '�':  ord:=30;
          '�':  ord:=32;
          '�':  ord:=34;
          '�':  ord:=36;
          '�':  ord:=38;
          '�':  ord:=40;
          '�':  ord:=42;
          '�':  ord:=44;
          '�':  ord:=46;
          '�':  ord:=48;
          '�':  ord:=50;
          '�':  ord:=52;
          '�':  ord:=54;
          '�':  ord:=56;
          '�':  ord:=58;
          '�':  ord:=60;
          '�':  ord:=62;
          '�':  ord:=64;
          '�':  ord:=66;
    end
 end;

{////////////�ࠢ�����//᫮�//��/��䠢���//////////////////////////////////////////////////}
 function srav(var z1, z2: stroka; r: boolean): boolean; {��䠢�� ����: �� �� ��...}
 {��ࠬ��� ⨯� boolean �⢥砥� �� �ࠢ����� �� >= ��� ���� >. �᫨ ��।����� true, �㤥� �ࠢ�������� �� >=,
 � �᫨ False - �� >}
 var i, m: integer;
     z: stroka;
     fl: boolean;
 begin
   srav:=true;
   fl:=true;
   if z1.dlin>z2.dlin then
      m:=z2.dlin
   else
      m:=z1.dlin;
   i:=1;
   while (i<=m) and fl do begin
       if ((ord(z1.slovo[i])<ord(z2.slovo[i])) and fl ) then
          srav:=false;
       if ord(z1.slovo[i])>ord(z2.slovo[i]) then begin
          fl:=false
       end;
       if fl and (i=m) and ((z1.dlin>z2.dlin) or not(r)) then begin
           srav:=false;
       end;
       i:=i+1
   end
 end;
{/////////////////////////////////////////////////////////////}
end.








