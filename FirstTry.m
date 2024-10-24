% Sensors and logic test.
global key
InitKeyboard();
function turn(direction)
if direction == "left"
    brick.StopAllMotors;
    brick.MoveMotor('AD', -30);
    pause(0.5);
    brick.MoveMotor('A', -30);
    brick.MoveMotor('D', 30);
    pause(1.5);
    brick.StopAllMotors;
else
    brick.StopAllMotors;
    brick.MoveMotor('AD', -30);
    pause(0.5);
    brick.MoveMotor('A', 30);
    brick.MoveMotor('D', -30);
    pause(1.5);
    brick.StopAllMotors;
end
end
while 1
    pause(0.1);
    distance = brick.UltrasonicDist(3);
    brick.SetColorMode(2, 2);
    color = brick.ColorCode(2);

    brick.MoveMotor('AD', 30);
    touch = brick.TouchPressed(1);

    if touch == 1
        turn("left");
    else
        brick.MoveMotor('AD', 80);
    end

    if color == 5
        brick.StopAllMotors;
        pause(1);
        brick.MoveMotor('AD', 50);
 
    else
        brick.MoveMotor('D', 50);
        brick.MoveMotor('A', 50);
    end





    switch key
        case 'z'
            brick.StopAllMotors;
        case 'q'
            brick.StopAllMotors;
            break;
    end
end