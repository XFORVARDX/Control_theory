clc; clear all
h=0.1;
n=2
a0=-1;
b0=3;
f=@(x)x^4-0.9*atan(2.5*x);

x=a0:0.1:b0;
x0=5;
k=1;
del=k*h;

if ((x0+del)^4-0.9*atan(2.5*(x0+del)))<(x0^4-0.9*atan(2.5*x0))
    while ((x0+del)^4-0.9*atan(2.5*(x0+del)))<(x0^4-0.9*atan(2.5*x0))
        xn=x0;
        x0=x0+del
        k=k+1;
        del=k*h;
    end
else
    while ((x0-del)^4-0.9*atan(2.5*(x0-del)))<(x0^4-0.9*atan(2.5*x0))
    xn=x0;
    x0=x0-del
    k=k+1;
    del=k*h;
    xk=x0
    end
end
x_min=[xn; x0]
F1=x_min.^4-0.9*atan(2.5*x_min);
F=x.^4-0.9*atan(2.5*x);
plot(x,F,'k',x_min,F1,'r','LineWidth',1.2);

