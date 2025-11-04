mymotor = motor(Brick,'AD');
mymotor.Speed = 50;

start(mymotor);
wait 0.5;
stop(mymotor);