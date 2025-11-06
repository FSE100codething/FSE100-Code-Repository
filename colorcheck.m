colorcheck = brick.SetColorMode(1,2);
while 1

if (colorcheck == 5)
pause(1.0);
end
if (colorcheck == 2)
brick.StopMotor('AD', 'Brake');
brick.beep();
brick.beep();
brick.MoveMotor('AD', 0);
end
if (colorcheck == 3)
brick.StopMotor('AD', 'Brake');
brick.beep();
brick.beep();
brick.beep();
brick.MoveMotor('AD', 0);
end
end
