clear all

p=[1 4 20];
b =[4 ];
r=roots(p) 
r1=r(1);
dp=polyder(p)
A1=polyval(dp, r1) 
B1= polyval(b, r1)
C1=B1./A1 



t =[0:0.01:5];
x =  2*exp(-2.*t).*(2*cos(4.*t)- sin(4.*t))

r2=r(2);
plot(t,x), grid on, xlabel('Time(sec)'), ylabel('x(t)')
