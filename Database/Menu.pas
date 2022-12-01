Program readd(filename, output);

uses module;

const filename = 'T3.test';

var f: ff;
    menu{переменная, обозначающая пункт меню}, col{количество коробок пастилы}, m, m1{переменные для
    считывания различных данных при выполнении одного из пунктов меню},res{стоимость из п.4}: integer;
    mas: pas;{массив коробок}

begin
   assign(f, filename);
   reset(f);
   col:=1;

   while not(eof(f)) do begin
        read(f, mas[col]);
        col:=col+1
   end;

   menu:=1;
   while menu<>6 do begin
      writeln('Меню');
      writeln('1. Вывести на экран данные о всех коробках');
      writeln('2. Вывести номера коробок пастилы, на которые есть скидка в заданном месяце');
      writeln('3. Определить самый удачный месяц для покупки пастилы');
      writeln('4. Вывести стоимость самой дешёвой коробки, в которой не менее некоторого количества упаковок заданного вкуса');
      writeln('5. Вывести номер лучшей по рейтингу коробки, которую можно приобрести в данный момент за заданную сумму');
      writeln('6. Закончить');
      readln(menu);
      case menu of
        1: readbox(f);
        2: begin
            writeln('Введите номер месяца');
            readln(m);
            outpMonthSale(col, cchr(m), mas);
           end;
        3: UdMonth(mas, col);
        4: begin
              writeln('Введите вкус');
              printTaste;
              readln(m);
              writeln('Введите количество');
              readln(m1);
              res:=SumCost(mas, m1, col, m);
              if res<>maxInt then
                    writeln(res)
              else
                    writeln('Нет подходящих коробок')
           end;
        5:begin
            writeln('Введите денежную сумму');
            readln(m);
            five(mas, col, m);
          end;
        6: ;
      end;
      writeln;
   end

end.









