% Fifth, and likely final, implementation of Project Spyn.
global key;
InitKeyboard();

brick.playTone(100, 261.63, 250);
pause(0.25);
brick.playTone(100, 329.63, 250);
pause(0.25);
brick.playTone(100, 392.00, 250);
pause(0.25);
brick.playTone(100, 523.25, 250);
pause(0.25);

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
%}

brick.SetColorMode(3, 2);
readyToMoveLeft = false;

while true
    pause(0.1);
    color = brick.ColorCode(3);
    touch = brick.TouchPressed(1);
    distance = brick.UltrasonicDist(4);

    % Red detection override.
    if color == 5
        brick.StopAllMotors;
        brick.playTone(100, 1318.51, 300);
        pause(2.5);
        brick.MoveMotor('AD', 40);
        pause(0.4);

    elseif color == 3 % DEMONSTRATION: ONLY CHANGE THIS CONDITION!!!
        %{
          Color references:
          0    No color/Unknown
          1    Black (Is detected if color sensor is too high up from ground)
          2   *Blue*
          3   *Green*
          4   *Yellow*
          5    Red
          6    White
          7    Brown
          Set the *target color* on demonstration day!!!
        %}

        brick.StopAllMotors;
        break;
    else

        % New default moving with slight adjustments
        if distance <= 14
            if color == 5
                brick.StopAllMotors;
                brick.playTone(100, 1318.51, 300);
                pause(2.5);
                brick.MoveMotor('AD', 40);
                pause(0.4);
            end
            brick.MoveMotor('A', 15);
            brick.MoveMotor('D', -15);
            pause(0.15);
            brick.MoveMotor('AD', 40);
            pause(0.175);
        elseif (distance > 14 && distance < 50)
            if color == 5
                brick.StopAllMotors;
                brick.playTone(100, 1318.51, 300);
                pause(2.5);
                brick.MoveMotor('AD', 40);
                pause(0.4);
            end
            brick.MoveMotor('A', -15);
            brick.MoveMotor('D', 15);
            pause(0.15);
            brick.MoveMotor('AD', 40);
            pause(0.175);
        elseif (distance > 10 && distance < 15)
            if color == 5
                brick.StopAllMotors;
                brick.playTone(100, 1318.51, 300);
                pause(2.5);
                brick.MoveMotor('AD', 40);
                pause(0.4);
            end
            brick.MoveMotor('AD', 35);
            pause(0.35);
        end

        % If touch, turn right.
        if touch == 1 && readyToMoveLeft == false
            brick.StopAllMotors;
            brick.playTone(100, 659.25, 100);
            brick.playTone(100, 622.25, 100);
            brick.playTone(100, 587.33, 100);
            brick.playTone(100, 554.37, 100);
            brick.playTone(100, 523.25, 100);
            brick.playTone(100, 493.88, 100);
            brick.playTone(100, 466.16, 100);
            brick.playTone(100, 440.00, 100);
            brick.playTone(100, 415.30, 100);
            brick.playTone(100, 392.00, 100);
            pause(1);

            % Move back a bit.
            brick.MoveMotor('AD', -40);
            pause(1.3);

            % Turn right.
            brick.MoveMotor('A', 28);
            brick.MoveMotor('D', -28);
            pause(1.4);

            % Move forward a bit before change condition.
            brick.MoveMotor('AD', 80);
            pause(0.9);
        end

        % If distance >= 50, ready to move left.
        if distance >= 50
            brick.StopAllMotors;
            readyToMoveLeft = true;
        end

        % If readyToMoveLeft and touching, move back and execute left turn.
        if readyToMoveLeft == true && touch == 1
            % Conditions OK.
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            pause(0.125);

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
            pause(1.22);

            readyToMoveLeft = false;
        end

        % Move left if readyToMoveLeft.
        if readyToMoveLeft
            % Conditions OK.
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            brick.playTone(100, 659.25, 125);
            pause(0.125);
            pause(0.125);

            % Turn left.
            brick.MoveMotor('D', 41);
            brick.MoveMotor('A', -26);
            pause(1.25);

            % Move forward a bit before change condition.
            brick.MoveMotor('AD', 80);
            pause(1.22);

            readyToMoveLeft = false;
        end
    end

    switch key
        case 'z'  % Hold to stop all motors.
            brick.StopAllMotors;
        case 'q'  % End program and stop motors.
            brick.StopAllMotors;
            break;
    end
end

brick.playTone(100, 523.25, 250);
pause(0.25);
brick.playTone(100, 392.00, 250);
pause(0.25);
brick.playTone(100, 329.63, 250);
pause(0.25);
brick.playTone(100, 261.63, 250);
pause(0.25);

CloseKeyboard();