global key
colorcheck = brick.SetColorMode(1,2);
while 1
if ((colorcheck == 2) || (colorcheck == 3) || (colorcheck == 4))
InitKeyboard();
switch key
    case 'uparrow'
    disp ('up arrow pressed!');
    brick.MoveMotor('AB', 20);
    case 'downarrow'
    disp('down arrow pressed!');
    brick.MoveMotor('AB', -20);
    case 'leftarrow'
    disp('left arrow pressed!');
    brick.MoveMotor('A', 20);
    case 'rightarrow'
    disp('right arrow pressed!');
    brick.MoveMotor('B', 20);
    case ((colorcheck~= 2) && (colorcheck~=3) && (colorcheck~=4))
    break;
end
end
end
