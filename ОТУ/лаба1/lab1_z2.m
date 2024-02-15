
C3=C1./(r1) 
C4=C2./(r2) 
B0= polyval(b, 0)
A0=polyval(p,0)
C0=B0./A0 
x1=C0+C3.*exp(r1.*t)+C4.*exp(r2.*t);

plot(t,x1), grid on, xlabel('Time(sec)'), ylabel('x1(t)')
syms s
y = poly2sym(p, s)
z = poly2sym(b, s)
expression = s*(z/y);
limit(expression, s, 0)
limit(expression, s, inf)