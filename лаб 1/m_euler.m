
h=0.01; % шаг
t=0:h:1; 
n=length(t);
x=zeros(1,n); x(1)=1;
for i=1:n-1

x(i+1)=x(i)+h*(9*t(i)^2*x(i)-(t(i)^5+t(i)^2)*x(i)^2);
end 
x_n=x(end)
% решение встроенным решателем
f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;

[t2,x2]=ode45(f,[0,1],1);
X_n=x2(end)
% точность,%
eps1=abs(X_n-x_n)/abs(X_n)*100
plot(t,x,'b',t2,x2,'k','LineWidth',2)
grid on
legend('Метод Эйлера','Встроенный решатель')