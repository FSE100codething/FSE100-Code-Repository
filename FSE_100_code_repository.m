brick = connectBrick(TEAM4); %connects device to EV3 vehicle labeled "TEAM4"
%--------------
% TOUCH SENSORS
%--------------
sense = brick.TouchPressed(1); % variable that indicates if touch sensor in port 1 is touched.

while 1
touch = brick.TouchPressed(1); % reads touch sensor connected to port 1.
 if touch
 brick.beep(); %beeps car if touch sensor connected to port 1 is pressed/bumped/touched
 break;
 end
end

bumps = brick.TouchBumps(1); % Indicates amount of times touch sensor in Port 1 has been bumped/touched.
display(bumps); % Displays amount of times  Touch Sensor in Port 1 was touched/bumped in main.
%------------------------
% LIGHT AND COLOR SENSORS
%------------------------
rgb = brick.SetColorMode(1, 4); %set color sensor connected to port 1 to RGB mode.

brightness = brick.LightReflect(1); % returns the brightness of reflected light in front of the sensor, as a positive integer between 0 and 255.  0 is dark, 255 is bright.

display(brightness); % prints amount of reflected light in sensor

brightness = brick.LightAmbient(1); % returns the brightness of ambient light in front of the sensor, as a positive integer between 0 and 255. 0 is dark ,255 is bright.

display(brightness);

color = brick.ColorCode(1); % returns the color of an object in front of the sensor as an integer between 0 and 7.
% 0 - No Color, 1 - Black, 2 - Blue, 3 - Green, 4 - Yellow, 5 - Red, 6 - White, 7 - Brown

brick.SetColorMode(1,2) % Set color connected to port 1 to Color Code Mode.

color = brick.ColorCode(1); % Gets color on Port 1.

display(color); % Prints color code of object.

%COLOR RGB
%Returns the detected color in front of the sensor as a row vector of 3
%numbers corresponding to red, green and blue values of reflected light.
brick.SetColorMode(1,4)
color_rgb = brick.ColorRGB(1); %returns color of an object in front of color sensor, as a row of red, green and blue values of reflected light.
% EXAMPLE
%print color of an object.
fprintf("\tRed:%d\n",color_rgb(1));
fprintf("\tGreen:%d\n",color_rgb(2));
fprintf("\tBlue:%d\n",color_rgb(3));

%ULTRASONIC SENSORS
distance = brick.UltrasonicDist(1);
%returns the positive distance from the front of the sensor to the nearest
%object in centimeters. If an object is too close or too far away, the
%function will return 255.

%EXAMPLE
distance = brick.UltrasonicDist(1) %Gets the distance to the nearest object
display(distance); %prints the distance

%GYRO SENSORS

%GyroCalibrate
brick.GyroCalibrate(1) %calibrates the gyro sensor (returns 0 value), which is meant to turn the current position of the sensor into the 0 reference.

%GyroAngle
angle = brick.GyroAngle(1);
%returns the rotation angle in degrees of the gyro sensor since previous
%reset. I.e gets current Gyro Angle

display(angle); %prints angle value.

%GyroRate
%returns the speed of rotation of the gyro sensor in degrees per second.

angleRate = brick.GyroRate(1);
%Returns the speed of rotation of the gyro sensor in degrees per second.
%prints angle value in main

%--------------
% MOTOR SENSORS
%--------------

%MoveMotor
%Starts a motor or multiple motors moving at a given speed.

brick.MoveMotor(MotorPort, Speed) %Speed = desired speed of the motor, as a
%signed number between -100 and 100. Negative numbers cause motors to
%reverse, 0 causes motor to stop.

%MotorPort is port that a motor is connected in, must be single quotes.
%aka 'A', 'B', 'C', 'D' or a combination of such.

brick.MoveMotor('A', 50) %Motor A forward at Half Speed

pause(1); %let motor turn for 1 second.

brick.MoveMotor('AB', 10); %Moves both Motor A and Motor B at 10%

brick.MoveMotor('A', -50);%Moves Motor A backwards at half-speed (50%).

brick.MoveMotor('AB', 0); %Stops both Motor A and Motor B.

%StopMotor
%Stops a given motor, with 2 optional types of braking.

brick.Stopmotor(MotorPort,BrakeType)
%MotorPort is the Letter(s) of the port that a motor is connected to, in
%single quotes: 'A','B','C','D', or a combination of such.
%BrakeType (optional) can either be the word 'Coast' or 'Brake' in single
%quotes.

%'Coast' allows the motor to drift to a stop.
%'Brake' performs a hard stop, and the brick tries to maintain that
%position. Over-use of this mode will cause the battery of the EV3 to drain
%quickly.
%if no BrakeType is given, code will default to Coast.

brick.StopMotor('A', 'Coast'); %Motor A drifts to stop.

%StopAllMotors
%Stops all motors connected to a brick.
brick.StopAllMotors('Brake'); %Hard stop, all motors.

%---------------
%ROTATE BY ANGLE
%---------------
%These functions allow a motor to be moved by precise angles.
%MoveMotorAngleRel
%Move a motor in a certain angle relative to it's current position.

brick.MoveMotorAngleRel(MotorPort, Speed, Angle, BrakeType);

%Speed is the desired speed of the motor, a positive number between 1 and
%100. Negative numbers cause the motor to rotate in the opposite direction.
% A SPEED OF 0 MUST NOT BE USED IN THIS FUNCTION!

%Angle is a positive integer in degrees of how much the motor should move.
%Negative numbers have no effect on this function.

%For proper operation, this function must always be followed by a call to 
% the "WaitForMotor" function. Commands to other motors may be given first 
% (for simultaneous operation) but a "WaitForMotor" call must be completed 
% before a new command is given to the motor.

brick.MoveMotorAngleRel('A', 20, -90, 'Brake') %Reverse motor A, 90 degrees
% with 20% speed, Hard stop.

brick.WaitForMotor('A'); %Wait for motor to complete motion

%MoveMotorAngleAbs
%Move a motor a certain absolute angle. Zero Degrees is wherever the
%motor starts at reset (Refer to ResetMotorAngle).

brick.MoveMotorAngleAbs(MotorPort,Speed,Angle,BrakeType)

%Refer to brick.MoveMotorAngleRel instructions for Speed/Angle.

%Move to 0 position.
brick.MoveMotorAngleAbs('A',20,0,'Brake');

%Move to 90 position.
brick.MoveMotorAngleAbs('A',20,90,'Brake');

%Move to -90 position.
brick.MoveMotorAngleAbs('A',20,-90,'Brake');

%Wait for motor to complete motion/angle rotation.
brick.WaitForMotor('A');

%WaitForMotor
%Waits for a motor to complete its angle rotation. Should only use for
%MoveMotorAngleRel and MoveMotorAngleAbs commands.

brick.WaitForMotor(MotorPort);

%ResetMotorAngle
%Resets the absolute position of a motor to 0. The current position becomes
%the new '0' Angle.

brick.ResetMotorAngle(MotorPort);

%For the best results, include the function at the beginning of your
%program, called once for each connected motor.

