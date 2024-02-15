p=[1 7 10];
b=[2 1]; 
r=roots(p) 
r1=r(1);
r2=r(2)
dp=polyder(p) 
A1=polyval(dp,r1) 
A2=polyval(dp,r2)
B1= polyval(b, r1) 
C1=B1./A1
B2= polyval(b, r2) 
C2=B2./A2 
t=[0:0.01:5] ;
x=C1.*exp(r1.*t)+C2.*exp(r2.*t);
plot(t,x),grid on, xlabel('Time(sec)'), ylabel('x(t)')
syms s
y = poly2sym(p, s)
z = poly2sym(b, s)
expression = s*(z/y);
limit(expression, s, 0)
limit(expression, s, inf)