clc 
clear all
K =[10.4747 2.0538 0.3799]

Kp=K(1);
Kd=K(2);
Ki=K(3);

Ty=0.6; 
h=0.00001;
t=0:h:1;
N=numel(t);  
t(1)=0;
X=[0 0 0 0]';
b0=0;b1=0;b2=40*Kp;b3=40*Ki;b4=40*Kd;
a1=35;a2=350+40*Kd;a3=40;a4=40*Ki;
f0=b0;
f1=b1-a1*f0;
f2=b2-a2*f0-a1*f1;
f3=b3-a3*f0-a2*f1-a1*f2;
f4=b4-a4*f0-a3*f1-a2*f2-a1*f3;
A=[ 0 1 0 0;0 0 1 0; 0 0 0 1;  -a4 -a3 -a2 -a1];
B=[f1;f2;f3;f4];
Xs = zeros(4, N); % предварительное выделение памяти для массива состояний
Xs(:,1) = X(:,1)';



for i=1:4
Xs(:,i+1) = Xs(:,i) + h*(A*Xs(:,i)+B);
end



for n = 4:N-1 % матричный метод Адамса
    Xs(:,n+1) = Xs(:,n) + (h/12)*(23*(A*Xs(:,n)+B) - 16*(A*Xs(:,n-1)+B)+  5*(A*Xs(:,n-2)+B));
end
plot (t,Xs(1,:))

grid on
hold on

alf = -(log(0.05)/0.2);
Xe = 1 - exp(-alf*t);
r = sum((Xe - X(1,:)).^2);

plot(t,Xe)
plot(t,Xe*1.05)
plot(t,Xe*0.95)
fill([t, fliplr(t)], [Xe*0.95, fliplr(Xe*1.05)], 'g', 'FaceAlpha', 0.1);
xlabel('t');
ylabel('h(t),hэ(t)');
title('Графики переходных функций');
