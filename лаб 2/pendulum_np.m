tn=0;
syms x1 x2
t=0:h:l;
x1=zeros(1,l/h); 
x2=zeros(1,l/h);
x1(1)=1;
x2(1)=1;
[t,X] = ode45(@pendulum_np,t_interval,start_cond)
function dXrt=pendulum_np(t,X)
dx1 = x1(1);
dx2 = x2(1);
dx3 = tan(0)+x2(1)
dx4 = exp(0)+14*x2(1)
dXdt = [dx1;dx2;dx3;dx4]
t_interval = [0 1]
start_cond = [1;1]
end


