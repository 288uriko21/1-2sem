Program Flag;
Uses doc, CRT;

{
   ����⨭ ���३
   109 ��㯯�
   �ࠪ⨪� �2.1 "�����"
}
type El = record
            size: integer;
            Op1: Longint;
            Op2: Longint;
          end;
     Bin = String;
     Bin_El = record
                size: integer;
                Op1: Bin;
                Op2: Bin;
              end;

{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{����� ࠡ��� � 䠩���}

var FR, FW: Text;

{�.�. �� �室 ���� 䠩� txt � ����� �ᥫ ���������,
                       �㤥� ������� �᫮ ��ᨬ���쭮}

Procedure El_File(var FR: Text; var A: El);
var c: Char;
Begin
  With A do
    {�������� ⥬, �� � ��ப� 3 �᫠,ࠧ�������� �஡����}
    Readln(FR, size, Op1, Op2);
end;

{����� ����� ࠡ��� � 䠩���}
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{����� ࠡ��� � El}

Procedure El_to_Bin_El(A: El; var B: Bin_El);
 {��ॢ�� �᫠ � ����筮� �᫮ (��ப� Bin)
   �᫨ �᫮ �� �����⨫���, � ������ � ���ᨢ -}
var TF: Boolean;
Begin
  B.size := A.size;
  B.Op1 := to_bin(A.Op1, A.size);
  B.Op2 := to_bin(A.Op2, A.size);
end;

{�㭪樨 �㬬� � ���⠭�� � ���������� 䫠���}
var CF, OvF, SF, ZF, i: Integer;

Function bin_add(B: Bin_El): Bin;
var s: Bin;
    c: Bin;
    S1, S2, Rez: Integer;
Begin
  CF := 0;
  ZF := 1;
  s := '';
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  {�஢�ઠ �� ����⨬���� �᫠ � 㪠������ �᫮ ���}
  Begin
   for i := B.size downto 1 do
   Begin
     S1 := ord(B.Op1[i]) - ord('0'); {S1 � S2 ���� 0 ���� 1}
     S2 := ord(B.Op2[i]) - ord('0');
     Rez := CF + S1 + S2;
     s := chr(Rez mod 2 + ord('0')) + s;
     CF := Rez div 2;
     if s[1] = '1' then
       ZF := 0;
   end;
   if s[1] = '1' then
     SF := 1
   else
     SF := 0;
   if (B.Op1[1] = B.Op2[1]) and (s[1] <> B.Op1[1]) then
     OvF := 1
   else
     OvF := 0;
   bin_add := s;
  end
  else
   bin_add := 'Wrong'
end;

Function bin_sub(B: Bin_El): Bin;
var s: Bin;
    c: Bin;
    S1, S2, Rez: Integer;
Begin
  CF := 0;
  ZF := 1;
  s := '';
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  {�஢�ઠ �� ����⨬���� �᫠ � 㪠������ �᫮ ���}
  Begin
   for i := B.size downto 1 do
   Begin
     S1 := ord(B.Op1[i]) - ord('0');
     S2 := ord(B.Op2[i]) - ord('0');
     Rez := 2 - CF + S1 - S2;
     s := chr(Rez mod 2 + ord('0')) + s;
     CF := 1 - Rez div 2;
     if s[1] = '1' then
       ZF := 0;
   end;
   if s[1] = '1' then
     SF := 1
   else
     SF := 0;
   if (B.Op1[1] <> B.Op2[1]) and (s[1] = B.Op2[1]) then
     OvF := 1
   else
     OvF := 0;
   bin_sub := s
  end
  else
   bin_sub := 'Wrong'
end;

{����� ����� ࠡ��� � El � Bin_El}
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{����� �뢮��}

Procedure Vivod(var FW: text; A: El);
 Function bz_dec(x: Longint; l: Integer): Longint;
 {��ॢ�� �᫠ � ��, � �᫨ ��� ����讥 ��� ����, � ���塞 梥�}
 Begin
   TextColor(2);
   if x >= deg(l) then    {�� ����頥��� � � �᫮ ���}
   begin
     TextColor(4);
     x := x mod deg(l)
   end;
   if x < 0 then   {�᫨ �� �室 ��諮 ����, � ���塞 梥�}
   begin
     x := x + deg(l);
     TextColor(4);   {���� ��ࠥ� ஫� ⮫쪮 ��᫥ ��宦����� z}
   end;
   bz_dec := x;
 end;
 Function zn_dec(x: Longint; l: Integer): Longint;
 {��ॢ�� �᫠ � ��������, �᫨ ��� ᫨誮� ���� ��� ᫨誮� ����讥 ������⥫쭮�}
 Begin
   TextColor(2);
   if x >= deg(l) then    {�� ���ࠢ��쭮� १, ���塞 梥�}
   begin
     TextColor(4);
     x := x mod deg(l);
   end;
   if x >= deg(l - 1) then
   begin
     TextColor(4);
     x := x - deg(l);
   end;
   if (x < 0) and (abs(x) > deg(l - 1)) then {���誮� ����讥 ���}
   begin
     TextColor(4);
     x := x + deg(l)
   end;
   zn_dec := x;
 end;
 Procedure Vivod1(A: El);
  Procedure Write1(x: Longint);
  {�뢮� ��� �᫠ � ᪮�����}
  Begin
    if x < 0 then
      Write('(', x, ')')
    else
      Write(x);
  end;
 var x1, x2: Longint;
     y1, y2: Longint;
     z: Longint;
 Begin
   x1 := bz_dec(A.Op1, A.size);    {��ॢ���� ��1 � ��2 � �� � ��}
   x2 := bz_dec(A.Op2, A.size);
   y1 := zn_dec(A.Op1, A.size);
   y2 := zn_dec(A.Op2, A.size);

   z := x1 + x2;
   z := bz_dec(z, A.size); {��ॢ���� z � ��, � ���塞 梥�, �᫨ z ��������}
   Write(x1,'+');
   Write1(x2);             {�뢮� x2 � ᪮�����, �᫨ �� ���}
   Write('=',z,' ');

   z := y1 + y2;
   z := zn_dec(z, A.size);
   Write(y1,'+');
   Write1(y2);
   Write('=',z,' ');

   z := x1 - x2;
   z := bz_dec(z, A.size);
   Write(x1,'-');
   Write1(x2);
   Write('=',z,' ');

   z := y1 - y2;
   z := zn_dec(z, A.size);
   Write(y1,'-');
   Write1(y2);
   Write('=',z,' ');
   TextColor(15);
   Writeln;
 end;
var B: bin_El;
    BSum: Bin;
    BSub: Bin;
    i: Integer;
Begin
  El_to_bin_El(A, B);
  Write(A.size, ' ');
  if (B.Op1 <> '2') and (B.Op2 <> '2') then
  begin
    Vivod1(A);          {�뢮� ���窨, �� ����� �� ������}
    i := B.size + 2;
    BSum := bin_add(B);

    Writeln(FW, A.Op1, ' ', A.Op2);
    Write(FW, '+ ', B.Op1, B.Op2:i, BSum:i);
    Write(FW, to_dec(BSum):B.size, to_dec_zn(BSum, B.size):B.size);
    Writeln(FW, '  ', ZF,SF,CF,OvF);

    BSub := bin_sub(B);
    Write(FW, '- ', B.Op1, B.Op2:i, BSub:i);
    Write(FW, to_dec(BSub):B.size, to_dec_zn(BSub, B.size):B.size);
    Writeln(FW, '  ', ZF,SF,CF,OvF);

    Writeln(FW);
  end
  else
  begin
    if B.Op1 = '2' then
      Writeln('ERROR ', A.Op1, ' is too large')
    else
    if B.Op2 = '2' then
      Writeln('ERROR ', A.Op2, ' is too large')
  end;
end;

var A: El;
    c: Bin;
    Read_Name, Write_Name: string;
Begin
  ClrScr;
  TextBackground(0);
  Write('First file - ');
  readln(Read_Name);
  Write('Second file - ');
  Readln(Write_Name);
  Assign(FR, Read_Name);
  Assign(FW, Write_Name);
  Reset(FR);
  Rewrite(FW);
  Writeln('****************************');
  While not(eof(FR)) do
  begin
    El_file(FR, A);
    Vivod(FW, A);
  end;
  Close(FW);
  Close(FR);
  Writeln('****************************');
end.


