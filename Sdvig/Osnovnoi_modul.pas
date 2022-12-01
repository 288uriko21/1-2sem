Program Osnovnoi_modul;
Uses CRT,module,modul_Pamyatka,Rybinskova;
{
   группа Юлии Рыбинсковой
   109 группа
   Практикум №1 "Интерфейс"
   Основной модуль
}
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
const X1_menu=1;
      Y1_menu=1;
	  X2_menu=120;
      Y2_menu=32;
	  X1_Zentr=30;
	  Y1_Zentr=10;
Procedure Menu();
{создает интерактивное меню
       и начальное окно}
 Procedure Raspolozhenie_Blocks(k:Integer;var X1,Y1,X2,Y2:Integer);
 {нахождение координат стрелки у блока под номером k
   схожа с процедурой в модуле modul_Pamyatka}
 Begin
   X1:=X1_Zentr-2;
   case k of
    1:
      Y1:=Y1_Sdvig;
    2:
      Y1:=Y1_Sdvig+1;
	3:
	  Y1:=Y1_Sdvig+2;
    end;
	X2:=X1+2;
	Y2:=Y1+1
 end;
 Procedure Oblozhka();
 Begin
   Treangl(X1_menu,Y1_menu,X2_menu,Y2_menu,Blue);
   GoToXY(X1_menu,Y2_text+1);
   print('enter              -> дальше/ввод');Writeln;
   print('стрелки вниз/вверх -> управление');Writeln;
   print('esc                -> выход из программы/к меню');Writeln;
   Window(X1_text,Y1_text,X2_text,Y2_text);
   GoToXY(1,1);
   print('Рыбинскова Юлия');Writeln;
   print('Замятин Андрей');Writeln;
   print('Беспалая Ангелина');Writeln;
   GoToXY(X1_Zentr,Y1_Zentr);
   print('Работа команд сдвига');
 end;
 Procedure Oblozhka_Menu();
 var X1,X2,Y1,Y2:Integer;
 Begin
   ClrScr;
   Raspolozhenie_Blocks(1,X1,Y1,X2,Y2);
   Window(X1+2,Y1,X2_text,Y2_text);
   print('Хотите:'); Writeln;
   print('1) Изучить теорию'); Writeln;
   print('2) Посмотреть на практике');
   Window(X1_text,Y1_text,X2_text,Y2_text);
 end;
var c:Char;
    k:Integer=0;
	X1,Y1,X2,Y2:Integer;
Begin
  Oblozhka();
  Repeat
    c:=Readkey;
  Until ord(c)=LastChar; {ждем ввода enter}
  repeat
    Oblozhka_Menu();
    Raspolozhenie_Blocks(k+2,X1,Y1,X2,Y2);
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
	      k:=k+2;
        Raspolozhenie_Blocks(k+2,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
        Write('->');
      end;
      if ord(c)=80 then {Стрелка вниз}
      begin
        GoToXY(X1,Y1);
        Write('  ');
	    k:=k+1;
	    if k>=2 then
	      k:=k-2;
        Raspolozhenie_Blocks(k+2,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
		Write('->');
	  end;
    Until (ord(c)=LastChar)or(ord(c)=QuitChar);
	if (ord(c)=LastChar)and(k=0) then
	begin
	  Pamyatka_Interface();
	end
    else if (ord(c)=LastChar)and(k=1) then
	begin
	  Nachalo();
	  Treangl(X1_text,Y1_text,X2_text,Y2_text,Blue);
	  TextColor(White);
	end
  Until ord(c)=QuitChar;
end;

begin
  TextColor(White);
  Menu();
end.
