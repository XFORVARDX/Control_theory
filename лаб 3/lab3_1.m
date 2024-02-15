clc; clear all
a0=-1;
b0=2;
f=@(x)x^4-0.9*atan(2.5*x);
a=[a0]; b=[b0]; k=1; eps=0.1; L=[a0 b0];
y=[a(k)+((3-sqrt(5))/2)*(b(k)-a(k))];
z=[a(k)+b(k)-y(k)];
Fy=[f(y(k))];Fz=[f(z(k))];
del=abs(a(k)-b(k));
while del>eps
    if Fy(k)<=Fz(k)
        a(k+1)=a(k); b(k+1)=z(k);
        y(k+1)=a(k+1)+b(k+1)-y(k);
        z(k+1)=y(k);  
    else 
        a(k+1)=y(k); b(k+1)=b(k);
        y(k+1)=z(k);
        z(k+1)=a(k+1)+b(k+1)-z(k);
    end
    L(k+1,:)=[a(k+1) b(k+1)];
    del=abs(a(k+1)-b(k+1));
    k=k+1;
    Fy(k)=f(y(k)); Fz(k)=f(z(k));
end
L
x_min=(a(k)+b(k))/2
F_min=f(x_min)
x=-1:0.1:2;
F=x.^4-0.9*atan(2.5*x);
plot(x,F,'k',x_min,F_min,'*r','LineWidth',1.2);
grid on
legend('Метод золотого сечения','min')
      
