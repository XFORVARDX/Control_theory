clear all

p=[1 4 20];
b =[4 0];
r=roots(p) 
r1=r(1);
dp=polyder(p)
A1=polyval(dp, r1) 
B1= polyval(b, r1)
C1=B1./A1 
C3=C1./r1
A0=polyval(p,0) 
B0= polyval(b, 0)  
C0=B0./A0 
t =[0:0.01:5];
trg =  exp(-2.*t).*(0.5*sin(4.*t))
x1 =C0+trg * 2
plot(t,x1), grid on, xlabel('Time(sec)'), ylabel('x1(t)') 