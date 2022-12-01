{Васильева 109 Обратная задача к флагам (1) вводится разрядность, операция и флаги}
               {программа генерирует два подходящих случайных числа,если это возможно}
               {или указывает почему такой набор невозможен}
Program obratflagi;
uses crt,flagi,windows;
type str=string[5];
     stroka=string;
const  RusText: Pchar='Русский текст';
var s:str;n,z,k,zf,sf,cf,ofl:integer;maxdva,polmax,x,y,u:longint; c:char;


{функция возвращаюшая случайное число из заданного интервала}
  function randomchik(a,b: longint): longint;
  begin
    randomchik:=random(b-a+1)+a
  end;


{****процедуры вывода для русских букв****}
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



  function perevod(s:str;k:integer):longint;  {перевод из двоичной сс в десятичную}
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

{**процедура красивого ввода**}
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
    writelnr('нажмите enter для ввода и escape для выхода');
    gotoxy(2,2);
    writer('разрядность:');
    gotoxy(17,2);
    writer('знак:');
    gotoxy(33,2);
    writelnr('флаги:');
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


{*********************процедура генерации чисел по флагам*****************************************}
  procedure generator(var x,y:longint; z,k:integer);
    procedure vivod(z:integer;x,y:longint);
    begin
      writer('пример чисел для выбранных операции и флагов: ');
      writeln(x,znak(z),y)
    end;
  begin
    if k>=12 then
    begin
      writelnr('Данный набор флагов невозможен');
      writelnr('zf=1 следовательно все биты результата =0,');
      writelnr('sf=1 значит самый левый(знаковый бит)=1,противеречие')
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
         writelnr('Данный набор флагов невозможен');
         writelnr('sf=0, следовательно знаковый бит результата =0,');
         writelnr('of=1, следовательно знаковые биты операндов равны,но не равны знаковому биту результата');
         writelnr(' 1...');
         writelnr('+');
         writelnr(' 1...');
         writelnr('_____ ');
         writelnr(' 0...');
         writelnr('но 1+1=10, значит cf также должен быть равен 1,противоречие')
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
         writelnr('Данный набор флагов невозможен');
         writelnr('sf=1,следовательно знаковый бит результата =1,');
         writelnr('of=1,следовательно знаковые биты операндов равны, но не равны знаковому биту результата');
         writelnr(' 0...');
         writelnr('+');
         writelnr(' 0...');
         writelnr('_____ ');
         writelnr(' 1...');
         writelnr('сумма левых битов<=1,так как 0+0=0 и возможная 1 перешедшая из младших разрядов ');
         writelnr('cf=1 значит сумма знаковых битов>=10,противоречие')
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
         writelnr('Данный набор флагов невозможен');
         writelnr('sf=0,следовательно знаковый бит =0');
         writelnr('of=1,следовательно знаковый бит результата равен биту второго операнда и не равен биту первого');
         writelnr(' 1...');
         writelnr('-');
         writelnr(' 0...');
         writelnr('_______');
         writelnr(' 0...');
         writelnr('cf=1 следовательно для беззнаковых чисел первый операнд меньше второго');
         writelnr('но старший разряд первого больше старшего разряда второго, противоречие')
       end;
    4: begin
         x:=randomchik(polmax,maxdva-1);
         y:=randomchik(0,x-polmax);
         vivod(1,x,y)
       end;
    5: begin
         writelnr('Данный набор флагов невозможен');
         writelnr('sf=1,следовательно знаковый бит =1');
         writelnr('of=1,следовательно знаковый бит результата равен биту второго операнда и не равен биту первого');
         writelnr(' 0...');
         writelnr('-');
         writelnr(' 1...');
         writelnr('_______');
         writelnr(' 1...');
         writelnr('cf=0 следовательно для беззнаковых чисел первый операнд больше второго');
         writelnr('но старший разряд первого меньше старшего разряда второго, противоречие')
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
              writelnr('Данный набор флагов невозможен');
              writelnr('zf=1 для вычитания возможен только если оба операнда равны');
              writelnr('так как не существует ситуации,когда 1 переходит в более старший разряд(вне ячейки)');
              writelnr('максимальные результат (2^(n-1)-1)-(2^(n-1))=2^n-1 помещается в ячейку');
              writelnr('так как операнды равны, of должен =0(знаковые биты операндов равны)');
              writelnr('и cf должен =0(так как первый операнд не меньше второго)')
            end;
     end;
  end;





{***************************основная программа*********************************}

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
        writer('проверка: ');
        write(x,znak(z),y,'=',u,' ');
        writeln(zf,sf,cf,ofl);
      end;
      writer('продолжить - любая клавиша,выйти - escape');
      c:=readkey;
      if ord(c)=27 then
        n:=0
    end;
  until n=0

end.



