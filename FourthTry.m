global key;
InitKeyboard();

%{
Cursor safe area.
HOLD DOWN the 'z' button to stop robot motion.
HOLD DOWN the 'q' button to stop the whole program.
===================

===================



Left motor in A
Right motor in D
Arm motor in B
Touch sensor in 1
Color sensor in 3
Distance sensor in 4



Color references:
0   No color/Unknown
1   Black (Is detected if color sensor is too high up from ground)
2   Blue
3   Green
4   Yellow
5   Red
6   White
7   Brown
Set the target color on demonstration day!!
%}

brick.SetColorMode(3, 2);
readyToMoveLeft = false;

while true
    pause(0.1);
    color = brick.ColorCode(3);
    touch = brick.TouchPressed(1);
    distance = brick.UltrasonicDist(4);

    % Default moving
    brick.MoveMotor('AD', 90);

    % If touch, turn right.
    if touch == 1 && readyToMoveLeft == false
        brick.StopAllMotors;
        brick.playTone(300, 1000, 100);
        brick.playTone(300, 900, 100);
        brick.playTone(300, 800, 100);
        brick.playTone(300, 700, 100);
        brick.playTone(300, 600, 100);
        brick.playTone(300, 500, 100);
        brick.playTone(300, 400, 100);
        brick.playTone(300, 300, 100);
        brick.playTone(300, 200, 100);
        brick.playTone(300, 100, 100);
        pause(0.1);

        % Move back a bit.
        brick.MoveMotor('AD', -40);
        pause(1.3);

        % Turn right.
        brick.MoveMotor('A', 28);
        brick.MoveMotor('D', -28);
        pause(1.4);

        % Move forward a bit before change condition.
        brick.MoveMotor('AD', 80);
        %pause(1.3);
    end

    % If red, stop 1 sec.
    if color == 5
        brick.StopAllMotors;
        pause(1);
        brick.MoveMotor('AD', 50);
    end

    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    % End the program when reaching target color.
    % FOR DEMONSTRATION: ONLY CHANGE THIS COLOR CONDITION!!!
    if color == 4 % DEMONSTRATION: ONLY CHANGE THIS CONDITION!!!
        %pause(0.2);
        brick.StopAllMotors;
        break;
    end
    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    % ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

    % If distance >= 50, ready to move left.
    if distance >= 50
        brick.StopAllMotors;
        readyToMoveLeft = true;
    end

    % If readyToMoveLeft and touching, move back and execute left turn.
    if readyToMoveLeft == true && touch == 1
        % Conditions OK.
        brick.playTone(300, 100, 100);
        brick.playTone(300, 200, 100);
        brick.playTone(300, 300, 100);
        brick.playTone(300, 400, 100);
        brick.playTone(300, 500, 100);
        brick.playTone(300, 600, 100);
        brick.playTone(300, 700, 100);
        brick.playTone(300, 800, 100);
        brick.playTone(300, 900, 100);
        brick.playTone(300, 1000, 100);
        pause(1);

        % Stop 1 sec.
        brick.StopAllMotors;
        pause(1);

        % Move back a bit.
        brick.MoveMotor('AD', -35);
        pause(0.85)

        % Stop again.
        brick.StopAllMotors;
        pause(0.1);

        % Turn left.
        brick.MoveMotor('D', 41);
        brick.MoveMotor('A', -26);
        pause(1.17);

        % Move forward a bit before change condition.
        brick.MoveMotor('AD', 80);
        pause(1.3);

        readyToMoveLeft = false;
    end
    
    % Move left if readyToMoveLeft.
    if readyToMoveLeft
        % Conditions OK.
        brick.playTone(300, 100, 100);
        brick.playTone(300, 200, 100);
        brick.playTone(300, 300, 100);
        brick.playTone(300, 400, 100);
        brick.playTone(300, 500, 100);
        brick.playTone(300, 600, 100);
        brick.playTone(300, 700, 100);
        brick.playTone(300, 800, 100);
        brick.playTone(300, 900, 100);
        brick.playTone(300, 1000, 100);
        pause(1);

        % Turn left.
        brick.MoveMotor('D', 41);
        brick.MoveMotor('A', -26);
        pause(1.25);

        % Move forward a bit before change condition.
        brick.MoveMotor('AD', 80);
        pause(1.3);

        readyToMoveLeft = false;
    end

    switch key
        case 'z'  % Hold to stop all motors.
            brick.StopAllMotors;
        case 'q'  % End program and stop motors.
            brick.StopAllMotors;
            break;
    end
end

CloseKeyboard();