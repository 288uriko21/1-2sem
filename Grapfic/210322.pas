{��ᨫ쥢� 109 ���⭠� ����� � 䫠��� (1) �������� ࠧ�來����, ������ � 䫠��}
               {�ணࠬ�� �������� ��� ���室��� ��砩��� �᫠,�᫨ �� ��������}
               {��� 㪠�뢠�� ��祬� ⠪�� ����� ����������}
Program obratflagi;
uses crt,flagi,windows;
type str=string[5];
     stroka=string;
const  RusText: Pchar='���᪨� ⥪��';
var s:str;n,z,k,zf,sf,cf,ofl:integer;maxdva,polmax,x,y,u:longint; c:char;


{�㭪�� ��������� ��砩��� �᫮ �� ��������� ���ࢠ��}
  function randomchik(a,b: longint): longint;
  begin
    randomchik:=random(b-a+1)+a
  end;


{****��楤��� �뢮�� ��� ���᪨� �㪢****}
  procedure writelnr(s:pchar);
  begin
    rustext:=s;
    OemToChar(rustext,rustext);
    writeln(rustext);
    chartooem(rustext,rustext)
  end;
  procedure writer(s:pchar);
  begin
    rustext:=s;
    OemToChar(RusText,RusText);
    write(Rustext);
    chartooem(rustext,rustext)
  end;



  function perevod(s:str;k:integer):longint;  {��ॢ�� �� ����筮� �� � ��������}
  var i,x,d:integer;
  begin
    x:=0;
    for i:=1 to length(s) do
    if s[i]='1' then
    begin
      d:= stependva(k-i);
      x:=x+d
    end;
    perevod:=x
  end;

  function znak(k:integer):char;
    begin
      if k=0 then
        znak:='+'
      else
        znak:='-'
    end;

{**��楤�� ��ᨢ��� �����**}
  procedure vvod(var s:str; var z,n:integer);
  var c:char;i:integer; M: array [1..6] of integer;

    procedure xto(k:integer);
    begin
      case k of
      1: begin
           window(M[1],4,M[1]+3,4);
           gotoxy(2,1);
           write(n);
         end;
      2: write(znak(z):2);
      3..6: write(s[k-2]:2)
      end;
    end;
  begin
    s:='0000';
    z:=0;
    n:=2;
    textbackground(black);
    textcolor(white);
    window(1,1,80,25);
    clrscr;
    writelnr('������ enter ��� ����� � escape ��� ��室�');
    gotoxy(2,2);
    writer('ࠧ�來����:');
    gotoxy(17,2);
    writer('����:');
    gotoxy(33,2);
    writelnr('䫠��:');
    writeln('zf:  sf:  cf:  of:':44);
    M[1]:=11;
    M[2]:=19;
    M[3]:=27;
    M[4]:=32;
    M[5]:=37;
    M[6]:=42;
    textcolor(black);
    textbackground(white);
    for i:=2 to 6 do
    begin
      window(M[i],4,M[i]+2,4);
      clrscr;
      xto(i)
    end;
    textbackground(yellow);
    window(M[1],4,M[1]+2,4);
    clrscr;
    xto(1);
    i:=1;
    repeat
      c:=readkey;
      if ord(c)=0 then
      begin
        c:=readkey;
        if (ord(c)=77) or (ord(c)=75) then
        begin
          textbackground(white);
          window(M[i],4,M[i]+2,4);
          clrscr;
          xto(i);
          if ord(c)=77 then
          begin
            i:=i+1;
            if i>6 then
              i:=i-6
            else;
          end
          else
          begin
            i:=i-1;
            if i<1 then
              i:=6-i
          end;
          textbackground(yellow);
          window(M[i],4,M[i]+2,4);
          clrscr;
          xto(i);
        end
        else
          if (ord(c)=72) or (ord(c)=80) then
          begin
            textbackground(yellow);
            window(M[i],4,M[i]+2,4);
            clrscr;
            case i of
            1: begin
                 if ord(c)=72 then
                 begin
                   n:=n-1;
                   if n<2 then
                     n:=17-n
                   else;
                 end
                 else
                 begin
                   n:=n+1;
                   if n>16 then
                     n:=n-15
                 end;
                 xto(1)
               end;
            2: begin
                 z:=1-z;
                 xto(2)
               end;
            3..6: begin
                    if s[i-2]='0' then
                      s[i-2]:='1'
                    else
                      s[i-2]:='0';
                    xto(i)
                  end;
            end
          end
        end
    until (ord(c)=27) or (ord(c)=13);
    if ord(c)=27 then
      n:=0
  end;


{*********************��楤�� �����樨 �ᥫ �� 䫠���*****************************************}
  procedure generator(var x,y:longint; z,k:integer);
    procedure vivod(z:integer;x,y:longint);
    begin
      writer('�ਬ�� �ᥫ ��� ��࠭��� ����樨 � 䫠���: ');
      writeln(x,znak(z),y)
    end;
  begin
    if k>=12 then
    begin
      writelnr('����� ����� 䫠��� ����������');
      writelnr('zf=1 ᫥����⥫쭮 �� ���� १���� =0,');
      writelnr('sf=1 ����� ᠬ� ����(������� ���)=1,��⨢��稥')
    end
    else
    if z=0 then
    case k of
    0: begin
         x:=randomchik(0,polmax-1);
         if x<>0 then
           y:=randomchik(0,polmax-x-1)
         else
           y:=randomchik(1,polmax-x-1);
         vivod(0,x,y)
       end;
    1,9: begin
         writelnr('����� ����� 䫠��� ����������');
         writelnr('sf=0, ᫥����⥫쭮 ������� ��� १���� =0,');
         writelnr('of=1, ᫥����⥫쭮 ������� ���� ���࠭��� ࠢ��,�� �� ࠢ�� ��������� ���� १����');
         writelnr(' 1...');
         writelnr('+');
         writelnr(' 1...');
         writelnr('_____ ');
         writelnr(' 0...');
         writelnr('�� 1+1=10, ����� cf ⠪�� ������ ���� ࠢ�� 1,��⨢��稥')
         end;
    2: begin
         x:=random(2);
         if x=0 then
         begin
           x:= randomchik(2,polmax-1);
           y:=randomchik(maxdva-x+1,polmax-1)
         end
         else
         begin
           x:=randomchik(polmax+2,maxdva-1);
           y:=randomchik(maxdva-x+1,polmax-1)
         end;
         vivod(0,x,y)
       end;
    3: begin
         x:=randomchik(polmax,maxdva-1);
         y:=randomchik(polmax+1,polmax+maxdva-1-x);
         vivod(0,x,y)
       end;
    4: begin
         x:=random(2);
         if x=0 then
         begin
           x:= randomchik(0,polmax-1);
           y:=randomchik(polmax,maxdva-x-1)
         end
         else
         begin
           x:=randomchik(polmax,maxdva-1);
           y:=randomchik(0,maxdva-x-1)
         end;
         vivod(0,x,y)
       end;
    5: begin
         x:=randomchik(1,polmax-1);
         y:=randomchik(polmax-x,polmax-1);
         vivod(0,x,y)
       end;
    6: begin
         x:=randomchik(polmax+1,maxdva-1);
         y:=randomchik(maxdva+polmax-x,maxdva-1);
         vivod(0,x,y);
       end;
    7: begin
         writelnr('����� ����� 䫠��� ����������');
         writelnr('sf=1,᫥����⥫쭮 ������� ��� १���� =1,');
         writelnr('of=1,᫥����⥫쭮 ������� ���� ���࠭��� ࠢ��, �� �� ࠢ�� ��������� ���� १����');
         writelnr(' 0...');
         writelnr('+');
         writelnr(' 0...');
         writelnr('_____ ');
         writelnr(' 1...');
         writelnr('�㬬� ����� ��⮢<=1,⠪ ��� 0+0=0 � ��������� 1 ���襤�� �� ������ ࠧ�冷� ');
         writelnr('cf=1 ����� �㬬� �������� ��⮢>=10,��⨢��稥')
       end;
    8: begin
         x:=0;
         y:=x;
         vivod(0,x,y)
       end;
    10: begin
          x:=randomchik(1,polmax-1);
          y:=maxdva-x;
          vivod(0,x,y)
        end;
    11: begin
          x:=polmax;
          y:=x;
          vivod(0,x,y)
        end;
    end
    else
    case k of
    0: begin
         x:=random(2);
         if x=0 then
         begin
           x:= randomchik(1,polmax-1);
           y:=randomchik(0,x-1);
           vivod(1,x,y)
         end
         else
         begin
           x:=randomchik(polmax+1,maxdva-1);
           y:=randomchik(polmax,x-1);
           vivod(1,x,y)
         end;
       end;
    1: begin
         x:=randomchik(polmax,maxdva-2);
         y:=randomchik(x-polmax+z,polmax-1);
         vivod(1,x,y)
       end;
    2: begin
         x:=randomchik(0,polmax-2);
         y:=randomchik(polmax+x+1,maxdva-1);
         vivod(1,x,y)
       end;
    3: begin
         writelnr('����� ����� 䫠��� ����������');
         writelnr('sf=0,᫥����⥫쭮 ������� ��� =0');
         writelnr('of=1,᫥����⥫쭮 ������� ��� १���� ࠢ�� ���� ��ண� ���࠭�� � �� ࠢ�� ���� ��ࢮ��');
         writelnr(' 1...');
         writelnr('-');
         writelnr(' 0...');
         writelnr('_______');
         writelnr(' 0...');
         writelnr('cf=1 ᫥����⥫쭮 ��� ����������� �ᥫ ���� ���࠭� ����� ��ண�');
         writelnr('�� ���訩 ࠧ�� ��ࢮ�� ����� ���襣� ࠧ�鸞 ��ண�, ��⨢��稥')
       end;
    4: begin
         x:=randomchik(polmax,maxdva-1);
         y:=randomchik(0,x-polmax);
         vivod(1,x,y)
       end;
    5: begin
         writelnr('����� ����� 䫠��� ����������');
         writelnr('sf=1,᫥����⥫쭮 ������� ��� =1');
         writelnr('of=1,᫥����⥫쭮 ������� ��� १���� ࠢ�� ���� ��ண� ���࠭�� � �� ࠢ�� ���� ��ࢮ��');
         writelnr(' 0...');
         writelnr('-');
         writelnr(' 1...');
         writelnr('_______');
         writelnr(' 1...');
         writelnr('cf=0 ᫥����⥫쭮 ��� ����������� �ᥫ ���� ���࠭� ����� ��ண�');
         writelnr('�� ���訩 ࠧ�� ��ࢮ�� ����� ���襣� ࠧ�鸞 ��ண�, ��⨢��稥')
       end;
    6: begin
         x:=random(2);
         if x=0 then
         begin
           x:= randomchik(0,polmax-2);
           y:=randomchik(x+1,polmax-1)
         end
         else
         begin
           x:=randomchik(polmax,maxdva-2);
           y:=randomchik(x+1,maxdva-1)
         end;
         vivod(1,x,y)
       end;
     7: begin
          x:=randomchik(0,polmax-1);
          y:=randomchik(polmax,x+polmax);
          vivod(1,x,y)
        end;
     8: begin
          x:=randomchik(0,maxdva-1);
          y:=x;
          vivod(1,x,y)
        end;
     9..11: begin
              writelnr('����� ����� 䫠��� ����������');
              writelnr('zf=1 ��� ���⠭�� �������� ⮫쪮 �᫨ ��� ���࠭�� ࠢ��');
              writelnr('⠪ ��� �� ������� ���樨,����� 1 ���室�� � ����� ���訩 ࠧ��(��� �祩��)');
              writelnr('���ᨬ���� १���� (2^(n-1)-1)-(2^(n-1))=2^n-1 ����頥��� � �祩��');
              writelnr('⠪ ��� ���࠭�� ࠢ��, of ������ =0(������� ���� ���࠭��� ࠢ��)');
              writelnr('� cf ������ =0(⠪ ��� ���� ���࠭� �� ����� ��ண�)')
            end;
     end;
  end;





{***************************�᭮���� �ணࠬ��*********************************}

begin
  randomize;
  repeat
    vvod(s,z,n);
    textbackground(black);
    textcolor(white);
    window(1,5,80,25);
    clrscr;
    gotoxy(1,1);
    if n<>0 then
    begin
      k:=perevod(s,4);
      maxdva:= stependva(n);
      polmax:=stependva(n-1);
      x:=maxdva;
      generator(x,y,z,k);
      if x<>maxdva then
      begin
        flags(z,maxdva,polmax-1,zf,sf,cf,ofl,x,y,u);
        writer('�஢�ઠ: ');
        write(x,znak(z),y,'=',u,' ');
        writeln(zf,sf,cf,ofl);
      end;
      writer('�த������ - �� ������,��� - escape');
      c:=readkey;
      if ord(c)=27 then
        n:=0
    end;
  until n=0

end.



