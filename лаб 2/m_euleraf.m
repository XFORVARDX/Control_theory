
h=0.0005;
l=0.5;
tn=0;
syms x1 x2
t=0:h:l;
x1=zeros(1,l/h); 
x2=zeros(1,l/h);
x1(1)=1;
x2(1)=1;

for N=1:l/h
    x1(N+1)=x1(N)+h*(tan(tn)+x2(N));
    x2(N+1)=x2(N)+h*(exp(tn)+14*x2(N));
    tn=h*N;
end

figure(1)
plot(t,x1,'--')
hold on


[T,X] = ode45(@s_du,[0 l],[1 1])
grid on
plot(T,X(:,1))
figure(2)
plot(t,x2,'--')
hold on


[T,X] = ode45(@s_du,[0 l],[1 1])

plot(T,X(:,2))
x=x2(end)
x_n=X(end,2)
grid on
legend('Метод Эйлера','Решение решателем')
eps1=abs(x-x_n)/abs(x)*100
