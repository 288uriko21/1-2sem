function check(s: spis; a: char): boolean; {поиск элемента}
begin
  if s=nil then
     check:=false
  else begin
     if(s^.elem=a) then
       check:=true
     else
       if s^.elem<a then
           check:=check(S^.R)
       else
           check:=(S^.L)
  end
end;

function check(s: spis; a: char): boolean;
var flag: boolean;
begin
  flag:=true;
  while (s<>nil) and flag do begin
        if s^.elem = a then
           flag:=false
        else begin
           if s^.elem<a then
              s:=s^.R
           else
              s:=s^.l
        end
  end;
  check:=not(Flag)
end;



