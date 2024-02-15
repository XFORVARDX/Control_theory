clc;clear all
h = 0.001;
t = 0:h:1;
l = length(t);      
x1 = zeros(1,l);
x2 = zeros(1,l);
tn = 0;
for i = 1:1/h
    x1(i+1) = x1(i) + h*(x2);
    x2(i+1) = x2(i)+h*(sin(log(i+1))+2*t*x1);
    tn = h*i;
end
% plot(t,x1,'red')
plot(t,x1,'green')



[T,X] = ode45(@s_du,[0 1],[0 0])

plot(T,X(:,1))
x=x1(end)
x_n=X(end,1)
grid on
legend('Метод Эйлера','Точное решение')
eps1=abs(x-x_n)/abs(x)*100