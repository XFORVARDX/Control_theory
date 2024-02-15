f = @(t1,x1);
h=0.1; % шаг
t=0:h:1; 
n=length(t);
x=zeros(1,n); x(1)=1;
i=1;
x(i+1)=x(i)+h*(9*t(i)^2*x(i)-(t(i)^5+t(i)^2)*x(i)^2);
for i=2:n-1
x(i+1)=x(i)+h/2*(3*f(t(i),x(i))-f(t(i-1),x(i-1)));
end 
x_n=x(end)

[t2,x2]=ode45(f,[0,1],1);
X_n=x2(end)

eps1=abs(X_n-x_n)/abs(X_n)*100
plot(t,x,'r',t2,x2,'g','LineWidth',2)
grid on