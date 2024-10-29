% Sensors and logic test.
global key;
InitKeyboard();

%{
function turn(direction)
    % Stop all motors before turning
    brick.StopAllMotors; % This was commented out

    % Move backward slightly
    brick.MoveMotor('AD', -30);
    pause(0.5);

    % Turn left or right based on the direction input
    if strcmp(direction, 'left')
        brick.MoveMotor('A', -30); % Left motor backward
        brick.MoveMotor('D', 30);  % Right motor forward
    else
        brick.MoveMotor('A', 30);  % Left motor forward
        brick.MoveMotor('D', -30); % Right motor backward
    end

    % Pause to allow the turn to complete
    pause(1.5);

    % Stop all motors after turning
    brick.StopAllMotors;
    end
%}

%{
distanceActive = true;
while distanceActive == true
    pause(0.1)
    distance = brick.UltrasonicDist(3);
end
%}

while 1
    pause(0.1);

    brick.SetColorMode(2, 2);
    color = brick.ColorCode(2);

    touch = brick.TouchPressed(1);

    % Default moving
    brick.MoveMotor('AD', 65);

    % If touch, turn right.
    if touch == 1
        brick.StopAllMotors;
        brick.MoveMotor('AD', -30);
        pause(1.5);

        brick.MoveMotor('A', 27);
        brick.MoveMotor('D', -27);
        pause(1.5);
    end

    % If red, stop 1 sec.
    if color == 5
        brick.StopAllMotors;
        pause(1);
        brick.MoveMotor('AD', 50);
    end

    if color == 2
        brick.StopAllMotors;
        brick.MoveMotor('AD', -40);
        pause(2.68);
        brick.MoveMotor('A', -30);
        brick.MoveMotor('D', 30)
        pause(1.8);
    end

    if color == 4
        brick.StopAllMotors;
        %pause(60);
        return;
    end

    %If distance > 30cm, turn left.
    %{
    if distance > 30
        brick.StopAllMotors;
        brick.MoveMotor('A', -30);
        brick.MoveMotor('D', 30);
        pause(1);
        brick.MoveMotor('AD', 30);
        pause(2);
    end
    %}

    switch key
        case 'z'    % Hold to stop all motors.
            brick.StopAllMotors;
        case 'q'    % End program and stop motors.
            brick.StopAllMotors;
            break;
    end
end