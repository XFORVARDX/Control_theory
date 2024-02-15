clc; clear all
% заданная функция
f=@(y)4*y(1)-1.5*y(2)+exp(1.16*(y(1))^2+1.4*(y(2))^2);
% начальные условия
eps1=0.0001; eps2=0.0005; M=15; 
k=1; c=3; z=1;
x(k,:)=[1 1];
% точное решение
y_f=fminsearch(f,x(k,:))
f1=@(x1)4+2.32*x1(1)*exp(1.16*(x1(1))^2+1.4*(x1(2))^2);
f2=@(x1)-1.5+2.8*x1(2)*exp(1.16*(x1(1))^2+1.4*(x1(2))^2);
while z~=0 %условие остановки
switch c
    case 3
    grad_f=[f1(x(k,:)) f2(x(k,:))];
    c=4;
    case 4
        % критерий окончания
        if norm(grad_f)<=eps1
            Y=x(k,:);
            z=0;
        else c=5;
        end
    case 5
        if k>=M
           Y=x(k,:);
           z=0;
        else c=6;
        end
    case 6
        syms t
        a(k,:)=x(k,:)-t*grad_f;
        fi=f(a(k,:));
        dfi=diff(fi);
        s=solve(dfi==0);
        tk(k,:)=double(subs(s));
        x(k+1,:)=x(k,:)-tk(k,:)*grad_f;
        c=7;
    case 7
        % условие окончания
        if norm(x(k+1,:)-x(k,:))<eps2 && abs(f(x(k+1,:))-f(x(k,:)))<eps2
            Y=x(k+1,:);
            z=0;
        else k=k+1; c=3;
        end
end
end
Y
k
x

