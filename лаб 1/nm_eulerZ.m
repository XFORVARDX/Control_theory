% неявный метод Эйлера 
clc; clear all
syms x t
a=diff(9*t^2*x-(t^5+t^2)*x^2,x,t);
f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;
dF = inline(a); % преобразуем в функции

h=0.005; % шаг 
t=0:h:1; eps=0.0001; % точность
n=length(t);
X=[1]; 
% определение Х1 явным м.Эйлера
X(2)=X(1)+h*f(t(1),X(1));

%метод простых итераций
for j=2:n-1 % цикл по n-м х
    x=[X(j)];
    del=1;
    i=0;
    while abs(del)>eps % цикл по i-м х
        i=i+1;
        x(i+1)=x(i)-(x(i)-X(j)-h*f(t(j),x(i))/(1-h*f(t(j),x(i))));
        del=x(i+1)-x(i);
    end
    X(j+1)=x(i);
end 
x_n=X(end)
% решение встроенным решателем
f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;

[t2,x2]=ode45(f,[0,1],1);
X_n=x2(end)
% точность,%
eps1=abs(X_n-x_n)/abs(X_n)*100
plot(t,X,'b',t2,x2,'k','LineWidth',2)
grid on
legend('Метод Эйлера','Встроенный решатель')