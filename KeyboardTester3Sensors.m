% This contains the sensor code. WIP!

global key
InitKeyboard();

% Right motor in D
% Left motor in A
% Arm in B

% Front touch sensor in 1
% Color sensor in 2
% Side distance sensor in 3

% Test side sensor code:
%{
while true
    pause(0.05);
    distance = brick.UltrasonicDist(3);

    if distance <= 15
        brick.beep();
    end
end
%}

% Test front touch code:
%{
global key
InitKeyboard();

while 1
    pause(0.05);
    touch = brick.TouchPressed(1);

    switch key
        case 'uparrow'
            % Move forwards
            if touch == 1
                brick.StopAllMotors;
            else
                brick.MoveMotor('D', 80);
                brick.MoveMotor('A', 80);
            end
        case 'downarrow'
            % Move backwards
            brick.MoveMotor('D', -80);
            brick.MoveMotor('A', -80);
        case 'leftarrow'
            % Turn left
            brick.MoveMotor('D', 60);
            brick.MoveMotor('A', -60);
        case 'rightarrow'
            % Turn right
            brick.MoveMotor('D', -60);
            brick.MoveMotor('A', 60);
        case 'q'
            break;
        case 0
            brick.StopAllMotors;
    end
end
CloseKeyboard();
%}

while 1
    pause(0.05);

    touch = brick.TouchPressed(1);

    brick.SetColorMode(2, 2);
    color = brick.ColorCode(2);

    distance = brick.UltrasonicDist(3);

    switch key
        case 'e'
            % Stops if detects color red.(While holding 'e')
            if color == 5
                brick.StopAllMotors;
                pause(1);
                brick.MoveMotor('D', 50);
                brick.MoveMotor('A', 50);
            else
                brick.MoveMotor('D', 50);
                brick.MoveMotor('A', 50);
            end
        case 'y'
            % Stops if detects distance < 25cm.(While holding 'y')
            if distance <= 25
                brick.StopAllMotors;
                %brick.MoveMotor('D', -30);
                %brick.MoveMotor('A', 30);
            else 
                brick.MoveMotor('D', 30);
                brick.MoveMotor('A', 30);
            end
        case 'r'
            disp(colour)
        case 't'
            disp(distance)
        
        case 'uparrow'
                % Move forwards
                brick.MoveMotor('D', 100);
                brick.MoveMotor('A', 100);
        case 'downarrow'
                % Move backwards
                brick.MoveMotor('D', -100);
                brick.MoveMotor('A', -100);
        case 'leftarrow'
            % Turn left
            brick.MoveMotor('D', 80);
            brick.MoveMotor('A', -80);
        case 'rightarrow'
            % Turn right
            brick.MoveMotor('D', -80);
            brick.MoveMotor('A', 80);
        case 0
            brick.StopMotor('D');
            brick.StopMotor('A');
            brick.StopMotor('B');
        case 'i'
            % Raise arm
            brick.MoveMotor('B', -10);
        case 'k'
            % Lower arm
            brick.MoveMotor('B', 10);
        case 'q'
            break;
    end
end
CloseKeyboard();
