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

 function ord(c:char): integer; {ord для русских букв (можно было сделать массивом)}
    begin
       case c of
           'А': ord:=1;
           'Б': ord:=3;
           'В': ord:=5;
           'Г': ord:=7;
           'Д': ord:=9;
           'Е': ord:=11;
           'Ё': ord:=13;
           'Ж': ord:=15;
           'З': ord:=17;
           'И': ord:=19;
           'Й': ord:=21;
           'К': ord:=23;
           'Л': ord:=25;
           'М': ord:=27;
           'Н': ord:=29;
           'О': ord:=31;
           'П': ord:=33;
           'Р': ord:=35;
           'С': ord:=37;
           'Т': ord:=39;
           'У': ord:=41;
           'Ф': ord:=43;
           'Х': ord:=45;
           'Ц': ord:=47;
           'Ч': ord:=49;
           'Ш': ord:=51;
           'Щ': ord:=53;
           'Ъ': ord:=55;
           'Ы': ord:=57;
           'Ь': ord:=59;
           'Э': ord:=61;
           'Ю': ord:=63;
          'Я':  ord:=65;
          'а':  ord:=2;
          'б':  ord:=4;
          'в':  ord:=6;
          'г':  ord:=8;
          'д':  ord:=10;
          'е':  ord:=12;
          'ё':  ord:=14;
          'ж':  ord:=16;
          'з':  ord:=18;
          'и':  ord:=20;
          'й':  ord:=22;
          'к':  ord:=24;
          'л':  ord:=26;
          'м':  ord:=28;
          'н':  ord:=30;
          'о':  ord:=32;
          'п':  ord:=34;
          'р':  ord:=36;
          'с':  ord:=38;
          'т':  ord:=40;
          'у':  ord:=42;
          'ф':  ord:=44;
          'х':  ord:=46;
          'ц':  ord:=48;
          'ч':  ord:=50;
          'ш':  ord:=52;
          'щ':  ord:=54;
          'ъ':  ord:=56;
          'ы':  ord:=58;
          'ь':  ord:=60;
          'э':  ord:=62;
          'ю':  ord:=64;
          'я':  ord:=66;
    end
 end;

{////////////сравнение//слов//по/алфавиту//////////////////////////////////////////////////}
 function srav(var z1, z2: stroka; r: boolean): boolean; {алфавит вида: Аа Бб Вв...}
 {параметр типа boolean отвечает за сравнение на >= или просто >. Если передавать true, будет сравниваться на >=,
 а если False - на >}
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








