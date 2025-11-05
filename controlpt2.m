%% Initialize brick

% Motor ports
leftMotor = 'A';
rightMotor = 'B';

% Sensor ports
usLeftPort = 2;       % left ultrasonic sensor
touchRightPort = 3;   % right touch sensor

% Motor speed
forwardSpeed = 30;
turnSpeed = 20;

% Ultrasonic thresholds
openSpaceThreshold = 70;  % full left turn
closeDistanceThreshold = 40; % veer left gradually

while true
    % Read left ultrasonic sensor
    leftDist = brick.UltrasonicDist(usLeftPort);
    
    % Read right touch sensor
    touchPressed = brick.TouchPressed(touchRightPort);
    
    % Display sensor readings
    disp(['Left US: ', num2str(leftDist), ' cm | Right Touch: ', num2str(touchPressed)]);
    
    %% --- Touch sensor logic (priority) ---
    if touchPressed
        disp('Right touch detected! Backing up and turning right...');
        
        % Stop motors
        brick.StopMotor('AB');
        pause(0.2);
        
        % Back up
        brick.MoveMotor(leftMotor, -forwardSpeed);
        brick.MoveMotor(rightMotor, -forwardSpeed);
        pause(1);  % adjust backing up distance
        
        % Turn right
        brick.MoveMotor(leftMotor, turnSpeed);
        brick.MoveMotor(rightMotor, -turnSpeed);
        pause(1.2);  % adjust turn duration
        
        % Resume forward
        brick.MoveMotor('AB', forwardSpeed);
        pause(0.2);
        
    %% --- Left ultrasonic sensor logic ---
    elseif leftDist > openSpaceThreshold
        % Full left turn
        disp('Open space detected on left! Turning left...');
        pause(.5)
        brick.StopMotor('AB');
        pause(0.2);
        
        brick.MoveMotor(leftMotor, -turnSpeed);
        brick.MoveMotor(rightMotor, turnSpeed);
        pause(1.2);  % adjust duration
        
        brick.MoveMotor('AB', forwardSpeed);
        pause(3);
        
    elseif leftDist > closeDistanceThreshold
        % Veer left gradually
        disp('Left distance moderate → veering left...');
        pause(.5)
        brick.MoveMotor(leftMotor, forwardSpeed - 5); % slightly slower
        brick.MoveMotor(rightMotor, forwardSpeed);    % slightly faster
        pause(0.1);
        
    else
        % Path clear → move straight
        brick.MoveMotor('AB', forwardSpeed);
    end
    
    pause(0.1);  % small delay to avoid overloading EV3
end
