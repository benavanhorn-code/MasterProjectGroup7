global key
InitKeyboard();
while true
    pause(0.1);
    switch key
        case 'uparrow'
            %disp('Up');
            brick.MoveMotor('B', 20);
            brick.MoveMotor('C', 20);
           
        case 'downarrow'
            %disp('Down');
            brick.MoveMotor('B', -20);
            brick.MoveMotor('C', -20);
           
        case 'leftarrow'
            brick.MoveMotor('C', 15);
            brick.MoveMotor('B', -15);
           
        case 'rightarrow'
            brick.MoveMotor('C', -15);
            brick.MoveMotor('B', 15);

        case 'space'
            brick.StopMotor('B');
            brick.StopMotor('C');
            brick.StopMotor('A');
        case 'w'
            brick.MoveMotor('A',-20);
            pause(1.6);
            brick.StopMotor('A');
        case 's'
            brick.MoveMotor('A',20);
            pause(1.4);
            brick.StopMotor('A');
        case 'escape'
            break;
    end
end