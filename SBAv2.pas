Program SBA;
Uses CRT;           //USES THE CRT LIBRARY
Var
   staff:array[1..3] of string;
   totsales:array[1..3] of real;
   com:array[1..3] of real;
   no,S,A,i,B:integer;
   high:real;
   
Const
     N=3;  //DEFINES THE AMOUNT OF PEOPLE THROUGHT THE PROGRAM

Procedure init;  //INITIALIZES THE PROGRAM
Begin
     Writeln('Initialization Started');
     For i:= 1 to N do
         Begin
              staff[i]:='';
              totsales[i]:=0.00;
              com[i]:=0.00;

         End;
     textbackground(green);
     Writeln('Initialization Success: Please Press Enter.');
     Readln();
     textbackground(black);
End;
Procedure DEBUG; //FOR DEBUGGING
Begin
     For i:= 1 to N do
         Begin
         Writeln(staff[i],' $', totsales[i]:5:2);
         End;
End;

Procedure displayinfo;
Begin
     For i:= 1 to N do
     Begin
          Writeln('Name of Sales Staff Member: ', staff[i]);
          Writeln('Total sales of member:$ ', totsales[i]:5:2);
          Writeln('Commission for member:$ ', com[i]:5:2);
          Writeln;
     end;
end;
Procedure input; //INPUT DATA INTO THE ARRAYS
Begin
     For i:= 1 to N do
         Begin
              textcolor(white);
              A:=1;
              Clrscr;
              Writeln('-------------------------------------------------------');
              Writeln('This part of the program will help you input the data.');
              Writeln('It will also automatically calculate the commission.');
              Writeln('Please Input Sales Staff Name:');
              Readln(staff[i]);
              Writeln('Please Input Total Sales For ', staff[i],':');
              Readln(totsales[i]);
                   While totsales[i] < 0 do //VALIDATION FOR POSITIVE NUMBER
                   Begin
                        Writeln('Please re-enter total sales for ', staff[i],':');
                        Readln(totsales[i]);
                        A:= A + 1;
                            If A >= 3       //STOPS THE PROGRAM IS FALSE INFORMATION IS BEING CONSTANTLY INPUT
                               then
                                   Begin
                                   textbackground(red);
                                   Writeln('Error: Too many invalid attempts.');
                                   Writeln('Program will terminate in 10 seconds');
                                   delay(10000);
                                   halt;
                                   end;


                   end;
              com[i]:=(totsales[i] * 0.03);
              Writeln('Commission for ', staff[i],' is $',com[i]:5:2);
              textcolor(green);
              Writeln('Press enter to continue...');
              Readln();
              textcolor(white);
         end;
end;
Procedure highcom; //FINDS THE HIGHEST COMMISSION
Begin
     high:=0;
     S:=1;
     B:=0;
    Repeat
        If com[S] > high
           Then
               Begin
                 high:=com[S];
                 B:=S;
               end
           Else
           Begin
                S:= S + 1;
           End;

    until S = N ;               //REPEATS DYNAMICALLY TO ALLOW FOR FLEXABILITY
    Clrscr;
    Writeln('Highest commission is $',high:5:2 ,' by ',staff[B]);
    Writeln('Total Sales for ', staff[B] ,' is $',totsales[B]:5:2);
end;
Procedure nocom;   //FINDS THE NUMBER OF PEOPLE WITH NO COMMISSION
Begin
   S:=1;
   no:=0;
   repeat
       If com[S] = 0.00
          then
              begin
                no:= no + 1;
                S:=S + 1;
              end
               else
               begin
               S:= S + 1;
               end;
   until S = N + 1;             //REPEATS DYNAMICALLY TO ALLOW FOR FLEXIBILITY
   Writeln('Number of people without commission :',no);
   Writeln('Press enter to continue...');
   readln();
end;
Begin
  {*Main Program*}
  init;
  input;
  highcom;
  nocom;
  displayinfo;
  textcolor(green);
  textbackground(white);
  Writeln('Success: Please Press Enter');
  readln();
end.
