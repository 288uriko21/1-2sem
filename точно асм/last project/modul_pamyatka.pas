Unit modul_Pamyatka;

{
   ��㯯� ���� �롨�᪮���
   109 ��㯯�
   �ࠪ⨪� �1 "����䥩�"
   ����� ��� ����⪨
}
interface

Uses CRT,module;

Procedure Pamyatka_Interface();
Procedure Treangl(x1,y1,x2,y2,CF:Integer);

implementation

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
{||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{��楤�� ᮧ���� ��אַ㣮�쭨� � ��࠭�묨 �ࠪ���⨪���}
Procedure Treangl(x1,y1,x2,y2,CF:Integer);
Begin
  Window(x1,y1,x2,y2);
  TextBackGround(CF);
  ClrScr
end;
Procedure Pamyatka_Interface();
{�᭮���� ��楤�� ���� � ࠡ��� � ����⪠��, ����砥� � ᥡ�:
 1) �뢮� ⥪�⮢, ��ࠥ� �� ,�� � ����
 2) ����䥩�, ���� ���짮��⥫� ����� ����� ������ �뢥��}
 Procedure Vivod_Pamyatka(k:Integer);
 {�뢮��� ������ ��� ����஬ k}
  Function Text_names(k:Integer):String;
  {��楤�� ��ᢠ����� ������ ����⪥(�ᥣ� �� 4+����) �������� 䠩��}
  Begin
    case k of
    1:
      Text_names:='Pamyatka1.txt';{����}
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
 {��宦����� ���न��� ��५�� � ����� ��� ����஬ k}
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
  print('�᭮���� ⥮��');
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
	k:Integer=0;{���稪, �㤥� ��室��� �� ����� ���� ������ ���� ��५��}
Begin
  repeat
    Vivod_Blocks();
    Raspolozhenie_Blocks(k+1,X1,Y1,X2,Y2);
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
	      k:=k+5;
        Raspolozhenie_Blocks(k+1,X1,Y1,X2,Y2);
        GoToXY(X1,Y1);
        Write('->');
      end;
      if ord(c)=80 then {��५�� ����}
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
