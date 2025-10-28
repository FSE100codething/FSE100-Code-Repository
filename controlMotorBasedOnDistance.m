
function speed = controlMotorBasedOnDistance(~)
    % Define distance thresholds
    closeThreshold = 20; % cm
    farThreshold = 50;   % cm
distance = brick.UltrasonicDist(1);  % Get distance to the nearest object.

display(distance);                   % Print distance.
    % Conditional motor speed based on distance
    if distance < closeThreshold
        brick.MoveMotor('AB', 0);     % Stop both motors A and B
        brick.MoveMotorAngleAbs('c', 20, 0, 'Brake');         % Move to 0 position
        brick.WaitForMotor('C'); % Wait for motor to complete motion
    elseif distance < farThreshold
        brick.MoveMotor('AB', 50);   % Motor A and B forward at half speed.
        pause(1);
    else
        brick.MoveMotor('AB', 100);   % Motor A and B forward at full speed.
        pause(1);
    end
end

