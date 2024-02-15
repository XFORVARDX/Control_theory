clc; clear all
a=10; b =-1; cc=1; d=2;
f=@(y)(a*y(1)+b*y(2)+exp((cc*y(1)^2)+d*y(2)^2));
eps1=0.1; eps2=0.15; M=10; k=1; c=3; tm = 1;
x=[0.5,1];
syms fs(x1,x2)
fs(x1,x2)=(a*x1+b*x2+exp((cc*x1^2)+d*x2^2));
tm1 = diff(fs,x1); 
tm2 = diff(fs,x2);
while tm ~= 0 
    switch c
        case 3
            gradf=double([subs(tm1,[x1,x2],[x(1),x(2)]),subs(tm2,[x1,x2],[x(1),x(2)])]);
            c=4;
        case 4
            if norm(gradf)<=eps1
                result = x;
                tm=0;
            else
                c=5;
            end
        case 5
            if k>=M
                result = x;
                tm=0;
            else
                c=6;
            end
        case 6
            syms tk
            xk=x-tk*gradf;
            phi=fs(xk(1),xk(2));
            t0test=real(double(solve(subs(diff(diff(phi)))==0)))
            t0=double(subs(solve(diff(phi)==0)));
            c=7;
        case 7
            xk=x-t0*gradf;
            c=8;
        case 8
            if norm(xk-x)<eps2 && abs(fs(xk(1),xk(2))-fs(x(1),x(2)))<eps2
            result = xk;
            tm=0;
            else
                k=k+1; c=3; x=xk;
            end
    end
end 
fmin=fminsearch(f,x)
k
result