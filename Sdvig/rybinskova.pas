Unit Rybinskova;
interface
uses module, crt;

Procedure Nachalo();

implementation

Procedure Nachalo();
var c: char;
    m, n, i, j, col, color, color2, CF, oOF, SF, ZF, cicle: integer;
    mas: massiv;
    numb8: shortint;
    numb16: integer;
    numb32: longint;
    TF: shortint=1;
    sign: boolean=True;
begin
   c:=input(numb8, numb16, numb32, col, mas);
   window(50, 7, 71, 9);
   textcolor(11);
   outdecimal(numb8, numb16, numb32, sign, col);
   textcolor(white);
   if ord(c)=QuitChar then exit;
   m:=0;
   n:=0;
   cicle:=1;
   paintTF(1,0,0);
   sdvc;
   repeat
     c:=readkey;
     if ord(c)=QuitChar then exit;
     if ord(c)=0 then begin
        c:=readkey;
        case ord(c) of
           72,80: if TF=1 then
                    if m=0 then m:=1
                    else m:=0
                  else if TF = 2 then
                    changel(n,c);
           75:  if TF<>1 then TF:=TF-1
                else TF:=3;
           77:  if TF<>3 then TF:=TF+1
                else TF:=1;
        end;
	paintTF(TF,m,n);
     end
     else begin
         if ord(c)=LastChar then
           if TF=1 then
	         if m=1 then begin
		       m:=0;
		       n:=0;
		       TF:=1;
                       c:=input(numb8, numb16, numb32, col, mas);
	               if ord(c)=QuitChar then exit;
		       paintTF(1,0,0);
                 end
	         else begin
                     window(50, 7, 68, 9);
                     clrscr;
                     textcolor(11);
                     sign:=not(sign);
                     outdecimal(numb8, numb16, numb32, sign, col);
                     textcolor(white);
                 end
	   else if TF = 2 then begin
	      case n of
              0: begin
                  for i:=1 to cicle do shll(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF);
                 end;
              1: begin
                  for i:=1 to cicle do shlr(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF);
                 end;
              2: begin
                  for i:=1 to cicle do sar(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF)
                 end;
              3: begin
                  for i:=1 to cicle do rol(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF)
                 end;
              4: begin
                  for i:=1 to cicle do ror(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF)
                 end;
              5: begin
                  for i:=1 to cicle do rcl(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF)
                 end;
              6: begin
                  for i:=1 to cicle do rcr(CF, SF, ZF, oOF, numb8, numb16, numb32, col, mas);
                  vvod(mas,col);
                  flags(CF,SF,ZF,oOF)
                 end
              end;
              window(50, 7, 68, 9);
              clrscr;
              textcolor(11);
              outdecimal(numb8, numb16, numb32, sign, col);
              textcolor(white);
           end
           else begin
             window(94, 4, 100, 4);
             clrscr;
             gotoXY(1, 1);
             read(cicle);
           end
     end
   until (ord(c)=QuitChar);
end;

END.







