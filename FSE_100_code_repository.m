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