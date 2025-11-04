%{
Ports map 
ultrasonic: 2       % Ultrasonic sensor (right side distance)
color: D            % Color sensor
touch: 1           % Touch sensor (front bumper)
left motor:  B      % Motor port A = left wheel
right motor: C      % Motor port D = right wheel
%}

%The power settings for each motor:
lwheel = 40; %need to edit this 
rwheel = 40; %need to edit this 
lbwheel = -40;
rbwheel = -50;
threshhold = 70;

%brick.SetColorMode(2,2);

while true
  brick.MoveMotor('B',lwheel);
  brick.MoveMotor('C',rwheel);

  touch = brick.TouchPressed(1);
  %color = brick.ColorCode('D');
  distance = brick.UltrasonicDist(3); 
  display(touch)
  display(distance)
  if touch ==1
    
    brick.StopMotor('BC', 'Brake');
    %dist = brick.UltrasonicDist(2);
    brick.MoveMotor('B', lbwheel);
    brick.MoveMotor('C', rbwheel);
    pause(1);
    brick.StopMotor('BC', 'Brake');
    brick.MoveMotor('C', 40);

    pause(2.2); %turning time, which we can change as needed
    brick.StopMotor('C','Brake');
    touch = 0;
    while brick.TouchPressed(1)
            pause(0.02); % small sleep to debounce and avoid busy-loop
        end
        % optional short delay to allow bounce to settle
        pause(0.05);
        prevTouch = 0; % reset so a new press can be detected
  elseif distance > threshhold %if the right wall disappears

      
      brick.StopMotor('BC', 'Brake');
      brick.MoveMotor('B', 30);

      pause(2.3); %turning time, which we can change as needed
      brick.MoveMotor('B',lwheel);
      brick.MoveMotor('C',rwheel);
      pause(3);

   %elseif distance
  end
  prevTouch = touch;

    % tiny pause to reduce CPU / sensor spam and help debounce
    pause(0.01);
end
