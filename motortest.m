brick.MoveMotorAngleAbs('C', 20, 0, 'Coast'); 

brick.WaitForMotor('C'); % Wait for motor to complete motion 
% Move to 90 Position

brick.MoveMotorAngleAbs('C', 20, 90, 'Coast');

brick.WaitForMotor('C'); %Wait for motor to complete motion

brick.MoveMotor('AB', 100);      % Motor A, B forward at full speed.

pause(1);                       % Let the motors turn for 1 second.

brick.StopAllMotors('Coast');   % Hard Stop, all motors.