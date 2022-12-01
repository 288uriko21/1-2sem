Program Rybinskova;

{Выполнено задание №5 из таблицы, только добавлена желтая рамочка на выбранный прямоугольник}

uses crt, module;

var c: char; {Считанная клавиша}
    pos: integer; {Идентификатор выбранного прямоугольника: 12
                                                            34 }

BEGIN
  ClrScr;
  Draw(1);   {изначально "выбран" верхний слева прямоугольник}
  pos:=1;
  c:='s';
  While ord(c)<>27 do begin {Если не нажата клавиша Esc}
        C:=ReadKey;
        if ord(c)=0 then begin
           C:=ReadKey;
           Case ord(c) of
             80: if (pos=1) or (pos=2) then
                     pos:=pos+2;      {вниз}
             72: if (pos=4) or (pos=3) then
                     pos:=pos-2;   {вверх}
             77: if (pos=1) or (pos=3) then
                     pos:=pos+1;   {вправо}
             75: if (pos=2) or (pos=4) then
                     pos:=pos-1    {влево}
           end;
           DRAW(pos);
        end
  end
END.
