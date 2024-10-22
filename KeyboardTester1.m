% This is just the basic driving module.
% No sensors or logic yet. This is for Implementation 1, which is just the main body.

global key
InitKeyboard();

% Right motor in D
% Left motor in A
% Arm in B

% Controls:
% Arrow keys to move
% i, k to raise and lower arm
% q to end

while 1
    pause(0.1);
    switch key
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
