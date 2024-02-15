P=[1 1 1]
Kp=P(1);
Kd=P(2);
Ki=P(3);
T_mod=20;
N=1000;
h=T_mod/N;
t(1)=0;
X(:,1)=[0 0 0 0 ]';
a0 = 0.2*Ki;
a1 = 0.2*Kp;
a2 = (3.2+0.2*Kd);
a3 = 0.8;
b0 = 0.2*Ki;
b1 = 0.2*Kp;
b2 = (3+0.2*Kd);
b3=0;
b4=0;
f0=b4;
f1=b3-a3*f0;
f2=b2-a2*f0-a3*f1;
f3=b1-a1*f0-a2*f2-a3*f2;
f4=b0-a0*f1-a1* f2-a2*f3;
A=[ 0 1 0 0 ;0 0 1 0 ;0 0 0 1;-a0 -a1 -a2 -a3];
B=[f1;f2;f3;f4];
for i=1:2
X(:,i+1)=X(:,i) + h*(A*X(:,i)+B);
t(i+1)=t(i) + h;
end
for i=3:N
X(:,i+1)=X(:,i) + (h/12)*(23*(A*X(:,i)+B) - 16*(A*X(:,i-1)+B) + 5*(A*X(:,i-2)+B));
t(i+1)=t(i) + h;
end
alfa=-log(0.05)/10;
for i=1:(N+1)
x_e(i)=1-exp(-alfa*t(i));
end
sum1=0;
for i=1:N
sum= sum1 + (X(1,i) - x_e(i))^2;
sum1= sum;
end
rez=h*sum
