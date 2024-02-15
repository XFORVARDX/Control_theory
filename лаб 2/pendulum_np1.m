h=0,5
l=2
tn=0;
syms x1 x2
t=[0 15];
t_interval = [0 15]
start_cond = [ 1; 1; 0; 0]
x1(1)=1;
x2(1)=1;

[t,X] = ode45(@pendulum_np,t_interval,start_cond,1)
function dXdt=pendulum_np(t,X)
dx1 = X(3);
dx2 = X(4);
dx3 = tan(0)+x2(1)
dx4 = exp(0)+14*x2(1)
dXdt = [dx1;dx2;dx3;dx4]

end


