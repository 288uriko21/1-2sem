unit module;



interface

uses Crt;

const X = 80;
      Y = 25;

procedure DRAW(position: integer); {����ᮢ�� �࠭� � ���⮬
                                    ��࠭���� ��אַ㣮�쭨�� �� �࠭�}

implementation

procedure DRAW(position: integer);
 var
   F: text;
   s: string[4];
   i: integer;
 begin
   ClrScr;

   assign(F, 'T.txt'); {䠩� � ᫮����}
   Reset(F);
               {//////////���������� �࠭� ��� ���� ��࠭���� ��אַ㣮�쭨��///////////}
   Window(1, Y div 2, X div 2, Y);
   TextBackGround(4);
   ClrScr;

   Window(X div 2 +1, Y div 2+1, X, Y);
   TextBackGround(5);
   ClrScr;

   Window(X div 2+1, 1, X, Y div 2);
   TextBackGround(2);
   ClrScr;

   Window(1, 1, X div 2, Y div 2);
   TextBackGround(3);
   ClrScr;
               {//////////////////////////////////////////////////////////////////////////}
   for i:=1 to position do  {�롮� ᮮ⢥�����饣� ᫮�� �� 䠩��}
       Readln(F, s);

   case position of  {������塞 ࠬ��� � ᫮�� �� ��࠭�� ��אַ㣮�쭨�}
     1: begin
           Window(1, 1, X div 2, Y div 2);
           TextBackGround(14);
           ClrScr;
           Window(2, 2, X div 2-1, Y div 2-1);
           TextBackGround(3);
           ClrScr;
           gotoxy(1+X div 4,1+Y div 4 );
           write(s)
        end;
     2: begin
           Window(X div 2+1, 1, X, Y div 2);
           TextBackGround(14);
           ClrScr;
           Window(X div 2+2, 2, X-1, Y div 2-1);
           TextBackGround(2);
           ClrScr;
           gotoxy(1+X div 4,1+Y div 4 );
           write(s)
        end;
     4: begin
           Window(X div 2 +1, Y div 2+1, X, Y);
           TextBackGround(14);
           ClrScr;
           Window(X div 2+2, Y div 2+2, X-1, Y-1);
           TextBackGround(5);
           ClrScr;
           gotoxy(1+X div 4,1+Y div 4 );
           write(s)
        end;
     3: begin
           Window(1, Y div 2+1, X div 2, Y);
           TextBackGround(14);
           ClrScr;
           Window(2, Y div 2+2, X div 2-1, Y-1);
           TextBackGround(4);
           ClrScr;
           gotoxy(1+X div 4,1+Y div 4 );
           write(s)
        end;
   end;

 end;

end.