f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;
h=0.05; % шаг
t=0:h:1;
n=length(t);
x=zeros(1,n); x(1)=1;
for i=1:n-1
    K1 = h*f(t(i),x(i));
    K2 = h*f(t(i)+h/2,x(i)+K1/2);
    K3 = h*f(t(i)+h/2,x(i)+K2/2);
    K4 = h*f(t(i)+h,x(i)+K3);
    x(i+1)=x(i)+1/6*(K1+2*K2+2*K3+K4);
end 
x_n=x(end)
[t2,x2]=ode45(f,[0,1],1);%решатель
X_n=x2(end)
o1=abs(X_n-x_n)/abs(X_n)*100%ошибка/точность
plot(t,x,'b',t2,x2,'--k','LineWidth',2)
grid on
legend('Рунге-Кутт','Встроенный решатель')