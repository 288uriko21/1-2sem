Unit modul_Pamyatka;

{
   группа Юлии Рыбинсковой
   109 группа
   Практикум №1 "Интерфейс"
   Модуль для памятки
}
interface

Uses CRT,module;

Procedure Pamyatka_Interface();
Procedure Treangl(x1,y1,x2,y2,CF:Integer);

implementation

{список констант
      X1_text=1;
      Y1_text=1;
      X2_text=120;
      Y2_text=25; окно текста, основное для всей программы
	  LastChar=13; enter
	  QuitChar=27; esc
	  X1_Sdvig=X1_text+4;
      Y1_Sdvig=Y1_text+4;
}
{||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{процедура создает прямоугольник с выбранными характеристиками}
Procedure Treangl(x1,y1,x2,y2,CF:Integer);
Begin
  Window(x1,y1,x2,y2);
  TextBackGround(CF);
  ClrScr
end;
Procedure Pamyatka_Interface();
{Основная процедура печати и работы с памятками, включает в себя:
 1) вывод текстов, стирает все ,что в окне
 2) интерфейс, дает пользователю выбрать какую пвмятку вывести}
 Procedure Vivod_Pamyatka(k:Integer);
 {Выводит памятку под номером k}
  Function Text_names(k:Integer):String;
  {процедура присваивает каждой памятке(всего их 4+общая) название файла}
  Begin
    case k of
    1:
      Text_names:='Pamyatka1.txt';{общая}
    2:
      Text_names:='Pamyatka2.txt';
    3:
      Text_names:='Pamyatka3.txt';
    4:
      Text_names:='Pamyatka4.txt';
    5:
      Text_names:='Pamyatka5.txt';
    end;
  end;
 var c: Char;
     FR: Text;
	 TF: Boolean=True;
 Begin
   Assign(FR,Text_names(k));
   Reset(fr);
   Treangl(X1_text,Y1_text,X2_text,Y2_text,Blue);
   TextColor(lightgray);
   while not eof(FR) do
   begin
     Read(FR,c);
	 if (c='$')and TF then
	 begin
	   TF:=not TF;
	   TextColor(white);
	 end
	 else if (c='$')and not TF then
	 begin
	   TF:=not TF;
	   TextColor(lightgray);
	 end
	 else
	   Write(c);
   end;
   TextColor(white);
   Close(fr);
 end;
 Procedure Raspolozhenie_Blocks(k:Integer;var X1,Y1,X2,Y2:Integer);
 {нахождение координат стрелки у блока под номером k}
 Begin
   X1:=X1_Sdvig-2;
   case k of
    1:
      Y1:=Y1_Sdvig;
    2:
      Y1:=Y1_Sdvig+1;
    3:
      Y1:=Y1_Sdvig+2;
    4:
      Y1:=Y1_Sdvig+3;
    5:
      Y1:=Y1_Sdvig+4;
    end;
	X2:=X1+2;
	Y2:=Y1+1
 end;
 Procedure Vivod_Blocks();
 var X1,X2,Y1,Y2:Integer;
 Begin
  Treangl(X1_text,Y1_text,X2_text,Y2_text,Blue);
  Raspolozhenie_Blocks(1,X1,Y1,X2,Y2);
  GoToXY(X2,Y1);
  print('Основная теория');
  Raspolozhenie_Blocks(2,X1,Y1,X2,Y2);
  GoToXY(X2,Y1);
  Write('shl (shr)');
  Raspolozhenie_Blocks(3,X1,Y1,X2,Y2);
  GoToXY(X2,Y1);
  Write('sal (sar)');
  Raspolozhenie_Blocks(4,X1,Y1,X2,Y2);
  GoToXY(X2,Y1);
  Write('rol (ror)');
  Raspolozhenie_Blocks(5,X1,Y1,X2,Y2);
  GoToXY(X2,Y1);
  Write('rcl (rcr)');
 end;
var c:char;
    X1,Y1,X2,Y2:Integer;
	k:Integer=0;{Счетчик, будет находить на каком месте должна быть стрелка}
Begin
  repeat
    Vivod_Blocks();
    Raspolozhenie_Blocks(k+1,X1,Y1,X2,Y2);
    GoToXY(X1,Y1);
    Write('->');
    repeat
      c:=Readkey;
      if ord(c)=72 then {Стрелка вверх}
      begin
	    GoToXY(X1,Y1);
	    Write('  ');{Стираю стрелку}
	    k:=k-1;
	    if k<0 then
	      k:=k+5;
        Raspolozhenie_Blocks(k+1,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
        Write('->');
      end;
      if ord(c)=80 then {Стрелка вниз}
      begin
        GoToXY(X1,Y1);
        Write('  ');
	    k:=k+1;
	    if k>=5 then
	      k:=k-5;
        Raspolozhenie_Blocks(k+1,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
		Write('->');
	  end;
    Until (ord(c)=LastChar)or(ord(c)=QuitChar);
	if ord(c)=LastChar then
	begin
	  Vivod_Pamyatka(k+1);
	  repeat
	    c:=readkey;
	  Until (ord(c)=LastChar)or(ord(c)=QuitChar);
	end
  Until ord(c)=QuitChar;
end;

end.
