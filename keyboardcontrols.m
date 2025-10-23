global key
brick.StopMotor('AD', 'Brake');

while 1

    color = brick.ColorCode(1);
    touch = brick.TouchPressed(2);
    distance = brick.UltrasonicDist(4); %catches distance to nearest object
display(touch)
brick.MoveMotor('AD', 35);

   if touch ==1
     brick.beep();
     brick.MoveMotor('AD', -35);
pause(1);
brick.MoveMotor('A', 25);
brick.MoveMotor('D', 25);
touch = 0;

   elseif distance > 25
       brick.MoveMotor('D', -30);
       brick.MoveMotor('A', 30);
       pause(0.5);
       brick.MoveMotor('AD', 20);
       pause(2);
       brick.StopMotor('AD');
   elseif color == 4
   end
end
   %display("1");
   InitKeyboard()
   while 1
       %display("2")
       pause(0.1);
       switch key
           
           case 'uparrow'
           brick.MoveMotorAngleRel('B', 1, 2, 'Coast');

           case 'downarrow'
               brick.MoveMotorAngleRel('B', 1, -2, 'Coast');
           
           case 'q'
brick.StopMotor('AD');
           case 'w'
            brick.MoveMootr('AD', 10);
            pause(0.5);
            brick.StopMotor('AD');
           case 's'
           brick.MoveMotor('AD', -10);
           pause(0.5)
           brick.StopMotor('AD');
           case 'a'
           brick.MoveMotor('A', -10);
           brick.MoveMotor('D', 10);
           pause(0.5)
           brick.StopMotor('AD');
           case 'd'
              brick.MoveMotor('A', 10);
              brick.MoveMotor('D', -10);
              pause(0.5);
              brick.StopMotor('AD');
       end
   end
  CloseKeyboard();