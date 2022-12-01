Unit doc;
{
����⨭ ���३ ��������
  109 ��
 �ࠪ⨪� �2.1 "����� (䠩��)"
}
interface

Function deg(l: Integer): Longint;
Function to_bin(N: Longint; l: Integer): string;
Function to_dec(Bin_N: string): Longint;
Function to_dec_zn(Bin_N: string; l: Integer): Longint;

implementation
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{����� ࠡ��� � El � Bin_El}


Function deg(l: Integer): Longint;
{�⥯��� ������}
Begin
  if l = 0 then
    deg := 1
  else
    deg := 2 * deg(l - 1)
end;

Function to_bin(N: Longint; l: Integer): string;
var i: Integer;
    Bin_N: string;
    TF: Boolean;
Begin
  TF := False;
  if (N < 0) and (abs(N) <= deg(l - 1)) then
    N := deg(l) + N    {����㥬�� ⥬, �� 堯��� ����⥫쭮�� �᫠
                        ᮢ� � ������� �᫠ 2^l - |N|}
  else
    TF := N < 0;
  Bin_N := '';
  for i := 1 to l do
  begin
    if N mod 2 = 0 then
      Bin_N := '0' + Bin_N
    else
      Bin_N := '1' + Bin_N;
    N := N div 2;
  end;
  TF := TF or (N <> 0);
  if TF then
    to_bin := '2'            {����饭�� � �訡��}
  else
    to_bin := Bin_N
end;

Function to_dec(Bin_N: string): Longint;
var i: Integer;
    N: Longint;
begin
  N := 0;
  for i := 1 to length(Bin_N)do
    if Bin_N[i] = '1' then
      N := N * 2 + 1
    else
      N := N * 2;
  to_dec := N;
end;

Function to_dec_zn(Bin_N: string; l: Integer): Longint;
var i: Integer;
    N: Longint;
begin
  N := to_dec(Bin_N);

  if N > deg(l - 1) then
    to_dec_zn := N - deg(l)
  else
    to_dec_zn := N
end;

{����� ����� ࠡ��� � El � Bin_El}
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
Begin
end.
