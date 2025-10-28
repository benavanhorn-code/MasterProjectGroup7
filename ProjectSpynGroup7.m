%{
Ports map 
ultrasonic: 2       % Ultrasonic sensor (right side distance)
color: D            % Color sensor
touch: A           % Touch sensor (front bumper)
left motor:  B      % Motor port A = left wheel
right motor: C      % Motor port D = right wheel
%}

lwheel = -50; %need to edit this 
rwheel = -50; %need to edit this 
lbwheel = 20;
rbwheel = 20;
threshhold = 50;

%brick.SetColorMode(2,2);

while true
  brick.MoveMotor('B',lwheel);
  brick.MoveMotor('C',rwheel);

  touch = brick.TouchPressed('A');
  %color = brick.ColorCode('D');
  distance = brick.UltrasonicDist(2); 

  if distance > threshold %if the right wall disappears
      pause(0.5); %this makes it wait to get past wall 
      brick.stopMotor('BC', 'Brake');
      brick.moveMotor('B', -20);
      pause(2.3); %turning time, which we can change as needed
      brick.StopMotor('B',lwheel);
      brick.MoveMotor('B',lwheel);
      brick.MoveMotor('C',rwheel);
      pause(2);
  end
  if touch 
    pause(1);
    brick.StopMotor('BC', 'Brake');
    dist = brick.UltrasonicDist(2);
    brick.MoveMotor('B', lbwheel);
    brick.MoveMotor('C', rbwheel);
    pause(1);
    brick.StopMotor('BC', 'Brake');
    brick.MoveMotor('C', -20);
    pause(2.3); %turning time, which we can change as needed
    brick.StopMotor('C',lwheel);
    brick.MoveMotor('B',lwheel);
    brick.MoveMotor('C',rwheel);
    pause(2);
  end
