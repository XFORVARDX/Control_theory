f = @(t1,x1)2*x1+(t1.^3).*cos(t1);
h=0.01; 
t=0:h:1; eps=0.0000001; 
n=length(t);
X=[0]; 
 
X(2)=X(1)+h*f(t(1),X(1));
 
for j=2:n-1 
    x=[X(j)];
    del=1;
    i=0;
    while abs(del)>eps 
        i=i+1;
        x(i+1)=X(j)+h*f(t(j),x(i));
        del=x(i+1)-x(i);
    end
    X(j+1)=x(i);
end 
x_n=X(end)
 
[s,u] = ode45(@(s,u)(2*u+s^3*cos(s)),[0,1],0);
X_n=u(end)
 
 
eps1=abs(X_n-x_n)/abs(X_n)*100
plot(t,X,'b',s,u,'g','LineWidth',2)
grid on
