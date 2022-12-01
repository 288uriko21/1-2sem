Program CALCULATIONS;

 uses module,
      Crt;

 var Fin, F: text;
     bit, i: integer;
     op1, op2, max: longint;
     FNamae, outFNamae: string;
Begin
   ClrScr;
   Writeln('Type plase a name of input file');
   Readln(FNamae);
   Writeln('And type a name of output file');
   readln(OutFNamae);
   Assign(Fin,FNamae);
   Assign(F, outFNamae);
   Reset(Fin);
   Rewrite(F);
   While not(EOF(Fin)) do begin
     Read(Fin, bit);
     Read(Fin, op1);
     Read(Fin, op2);
     max:=1;
     for i:=1 to bit do
        max:=2*max;
     if not((op1 > max-1) or (op1 < -max div 2) or
     (op2 > max-1) or (op2 < -max div 2) ) then begin
        writeln(F, bit, ' ', op1,' ', op2);
        write(F, '+ ');
        ConvertToBinary(max, op1, F); Write(F,'  ');
        ConvertToBinary(max, op2, F); Write(F,'  ');
        ADDbz(max,bit, op1, op2, F);
        writeln(F);
        write(F, '- ');
        ConvertToBinary(max, op1, F); Write(F,'  ');
        ConvertToBinary(max, op2, F); Write(F,'  ');
        SUBbz(max,bit, op1, op2, F);
        writeln(F);
        writeln(F)
     end
     else begin
       TextColor(4);
       write('ERROR! operand is too big in ');
       writeln(bit, ' ', op1,' ', op2)
     end;
   TextColor(0);
   end;
   close(Fin);
   close(F)
End.
