Program Osnovnoi_modul;
Uses CRT,module,modul_Pamyatka,Rybinskova;
{
   ��㯯� ���� �롨�᪮���
   109 ��㯯�
   �ࠪ⨪� �1 "����䥩�"
   �᭮���� �����
}
{ᯨ᮪ ����⠭�
      X1_text=1;
      Y1_text=1;
      X2_text=120;
      Y2_text=25; ���� ⥪��, �᭮���� ��� �ᥩ �ணࠬ��
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
{ᮧ���� ���ࠪ⨢��� ����
       � ��砫쭮� ����}
 Procedure Raspolozhenie_Blocks(k:Integer;var X1,Y1,X2,Y2:Integer);
 {��宦����� ���न��� ��५�� � ����� ��� ����஬ k
   �宦� � ��楤�ன � ���㫥 modul_Pamyatka}
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
   print('enter              -> �����/����');Writeln;
   print('��५�� ����/����� -> �ࠢ�����');Writeln;
   print('esc                -> ��室 �� �ணࠬ��/� ����');Writeln;
   Window(X1_text,Y1_text,X2_text,Y2_text);
   GoToXY(1,1);
   print('�롨�᪮�� ����');Writeln;
   print('����⨭ ���३');Writeln;
   print('��ᯠ��� ��������');Writeln;
   GoToXY(X1_Zentr,Y1_Zentr);
   print('����� ������ ᤢ���');
 end;
 Procedure Oblozhka_Menu();
 var X1,X2,Y1,Y2:Integer;
 Begin
   ClrScr;
   Raspolozhenie_Blocks(1,X1,Y1,X2,Y2);
   Window(X1+2,Y1,X2_text,Y2_text);
   print('����:'); Writeln;
   print('1) ������ ⥮��'); Writeln;
   print('2) ��ᬮ���� �� �ࠪ⨪�');
   Window(X1_text,Y1_text,X2_text,Y2_text);
 end;
var c:Char;
    k:Integer=0;
	X1,Y1,X2,Y2:Integer;
Begin
  Oblozhka();
  Repeat
    c:=Readkey;
  Until ord(c)=LastChar; {���� ����� enter}
  repeat
    Oblozhka_Menu();
    Raspolozhenie_Blocks(k+2,X1,Y1,X2,Y2);
    GoToXY(X1,Y1);
    Write('->');
    repeat
      c:=Readkey;
      if ord(c)=72 then {��५�� �����}
      begin
	    GoToXY(X1,Y1);
	    Write('  ');{���� ��५��}
	    k:=k-1;
	    if k<0 then
	      k:=k+2;
        Raspolozhenie_Blocks(k+2,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
        Write('->');
      end;
      if ord(c)=80 then {��५�� ����}
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
