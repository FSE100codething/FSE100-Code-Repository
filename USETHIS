%% --- Initialize Brick and Motors ---
% brick = ConnectBrick('GROUP-4');
leftMotor = 'A';
rightMotor = 'B';

%% --- Initialize Sensors ---
usLeftPort = 1;       
touchRightPort = 3;   
colorPort = 2;        

brick.SetColorMode(colorPort,2);  

%% --- Motor Settings ---
forwardSpeed = 50;
turnSpeed = 20;
manualSpeed = 20;

%% --- Ultrasonic Thresholds ---
openSpaceThreshold = 70;  
closeDistanceThreshold = 40; 

%% --- Initialize Manual Control Keys ---
manualKeys = struct('w',false,'a',false,'s',false,'d',false);

% Create a figure for capturing key presses
hFig = figure('Name','Manual Control','KeyPressFcn',@keyPress,'KeyReleaseFcn',@keyRelease);

disp('🤖 Starting continuous loop with automatic/manual mode...');

%% --- Continuous Loop ---
while true
    colorcheck = brick.ColorCode(colorPort);

    if ismember(colorcheck,[2,3,4,5]) % Manual mode
        % Move based on pressed keys
        if manualKeys.w
            brick.MoveMotor('AB',manualSpeed);
        elseif manualKeys.s
            brick.MoveMotor('AB',-manualSpeed);
        elseif manualKeys.a
            brick.MoveMotor(leftMotor,-manualSpeed);
            brick.MoveMotor(rightMotor,manualSpeed);
        elseif manualKeys.d
            brick.MoveMotor(leftMotor,manualSpeed);
            brick.MoveMotor(rightMotor,-manualSpeed);
        else
            brick.StopMotor('AB');
        end
    else
        %% --- Autonomous Mode ---
        leftDist = brick.UltrasonicDist(usLeftPort);
        touchPressed = brick.TouchPressed(touchRightPort);

        if touchPressed
            brick.StopMotor('AB');
            pause(0.2);
            brick.MoveMotor(leftMotor, -forwardSpeed);
            brick.MoveMotor(rightMotor, -forwardSpeed);
            pause(1);
            brick.MoveMotor(leftMotor, turnSpeed);
            brick.MoveMotor(rightMotor, -turnSpeed);
            pause(1.2);
            brick.MoveMotor('AB', forwardSpeed);
        elseif leftDist > openSpaceThreshold
        % Large open area on left — make a full left turn
        disp('Open space detected on left! Turning left...');
        pause(0.2);
        
        brick.StopMotor('AB');
        pause(0.2);
        
        brick.MoveMotor(leftMotor, -turnSpeed);
        brick.MoveMotor(rightMotor, turnSpeed);
        pause(1.2);  % Adjust turn angle
        
        brick.MoveMotor('AB', forwardSpeed);
        pause(2);
        
    elseif leftDist > closeDistanceThreshold
        % Slightly open — veer left gently
        disp('Left distance moderate → veering left...');
        pause(0.5);
        
        brick.MoveMotor(leftMotor, forwardSpeed - 5); % slower left motor
        brick.MoveMotor(rightMotor, forwardSpeed);    % faster right motor
        pause(0.1);
        
    else
        % Path clear — move straight ahead
        brick.MoveMotor('AB', forwardSpeed);s
        end
    end
    pause(0.05); % loop delay
end

%% --- Key Press Functions ---
function keyPress(src,event)
    switch event.Key
        case 'w', evalin('base','manualKeys.w=true;');
        case 'a', evalin('base','manualKeys.a=true;');
        case 's', evalin('base','manualKeys.s=true;');
        case 'd', evalin('base','manualKeys.d=true;');
    end
end

function keyRelease(src,event)
    switch event.Key
        case 'w', evalin('base','manualKeys.w=false;');
        case 'a', evalin('base','manualKeys.a=false;');
        case 's', evalin('base','manualKeys.s=false;');
        case 'd', evalin('base','manualKeys.d=false;');
    end
end
