Program vvod;

uses module;

var f: file of stroka;
    zap: stroka;

begin
  assign(f, 'T3.slov');
  rewrite(f);
  zap.dlin:=10;
  zap.slovo:='����ᮢ���';
  write(f, zap);
  zap.slovo:='�����ਥ��';
  write(f, zap);
  zap.slovo:='���������';
  write(f, zap);
  zap.slovo:='�������ਪ';
  write(f, zap);
  zap.slovo:='��⥫��⢮';
  write(f, zap);
  zap.slovo:='�����ࠬ��';
  write(f, zap);
  zap.slovo:='��⢥���';
  write(f, zap);
  zap.slovo:='��ᯮ���';
  write(f, zap);
  zap.slovo:='�୮����';
  write(f, zap);
  zap.slovo:='���ମ����';
  write(f, zap);
  zap.slovo:='娬��᪨�';
  write(f, zap);
  zap.slovo:='襯����';
  write(f, zap);
  zap.slovo:='祫�᪨���';
  write(f, zap);
  zap.slovo:='�ᬥ������';
  write(f, zap);
  zap.slovo:='�ࠥ����';
  write(f, zap);
  zap.slovo:='�墠�����';
  write(f, zap);
  zap.slovo:='��⨫�⭨�';
  write(f, zap);
  zap.slovo:='��奭�����';
  write(f, zap);
  zap.slovo:='ࠤ�������';
  write(f, zap);
  zap.slovo:='⠩�������';
  write(f, zap);
  zap.slovo:='ᠢ������';
  write(f, zap);
  zap.slovo:='������⠤�';
  write(f, zap);
  zap.slovo:='ᠡ�����';
  write(f, zap);
  zap.slovo:='㬭�������';
  write(f, zap);
  zap.slovo:='�ᬥ������';
  write(f, zap);
  zap.slovo:='䠭��⨪�';
  write(f, zap);
  zap.slovo:='㢮�쭥���';
  write(f, zap);
  zap.slovo:='��㫮����';
  write(f, zap);
  zap.slovo:='��㦨����';
  write(f, zap);
  zap.slovo:='ᢨ���쪠';
  write(f, zap);
  close(f);
end.











