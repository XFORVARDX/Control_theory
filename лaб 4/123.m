clc; clear all
f=@(x1,x2)(x1)^2*exp(1-15*(x1)^2-4*(x1-x2)^2);

 
xn = [0.2 0]
fun = @(x)(x(1))^2*exp(1-15*(x(1))^2-4*(x(1)-x(2))^2);
x0 = [0.2,0];
x = fminsearch(fun,x0)

[x1,x2] = meshgrid(-1:0.01:1, -1:0.01:1);
F=(x1).^2.*exp(1-15.*(x1.^2)-4.*(x1-x2).^2);

figure(1)
mesh(x1,x2,F);
syms x1 x2

g = gradient(f,[x1,x2]);
[X, Y] = meshgrid(-1:.1:1,-1:.1:1);
G1 = subs(g(1),[x1 x2],{X,Y});
G2 = subs(g(2),[x1 x2],{X,Y});
figure(2)
quiver(X,Y,G1,G2);
G1 = 1;
G2 = 1;
eps=0.001;

while G1 > eps || G2 > eps
    syms tk

    G1 = subs(g(1),[x1 x2],xn);
    G2 = subs(g(2),[x1 x2],xn);
    xn = [xn(1)-G1,xn(2)-G2];
    B=(diff(diff(f,x1),x1)*diff(diff(f,x2),x2))-(diff(diff(f,x1),x2))^2;
    S2 = double (subs(B,[x1,x2],xn))
    S1 = double (diff(fun(xn)))
    
end


fun(xn)