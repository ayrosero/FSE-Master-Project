% Connect the brick.
% REMEMBER TO RENAME THE BRICK TO THIS NAME!!!
brick = ConnectBrick('73827GROUP4');

% Play tone with frequency 1000Hz and duration of 500ms.
brick.playTone(100, 1000, 500);

% Get current battery level.
v = brick.GetBattVoltage();
disp(v)