Program Rybinskova;

{�믮����� ������� �5 �� ⠡����, ⮫쪮 ��������� ����� ࠬ�窠 �� ��࠭�� ��אַ㣮�쭨�}

uses crt, module;

var c: char; {��⠭��� ������}
    pos: integer; {�����䨪��� ��࠭���� ��אַ㣮�쭨��: 12
                                                            34 }

BEGIN
  ClrScr;
  Draw(1);   {����砫쭮 "��࠭" ���孨� ᫥�� ��אַ㣮�쭨�}
  pos:=1;
  c:='s';
  While ord(c)<>27 do begin {�᫨ �� ����� ������ Esc}
        C:=ReadKey;
        if ord(c)=0 then begin
           C:=ReadKey;
           Case ord(c) of
             80: if (pos=1) or (pos=2) then
                     pos:=pos+2;      {����}
             72: if (pos=4) or (pos=3) then
                     pos:=pos-2;   {�����}
             77: if (pos=1) or (pos=3) then
                     pos:=pos+1;   {��ࠢ�}
             75: if (pos=2) or (pos=4) then
                     pos:=pos-1    {�����}
           end;
           DRAW(pos);
        end
  end
END.
