function r=param(K)

Kp=K(1);
Kd=K(2);
Ki=K(3);


T=0.6; 
h=0.00001;
t=0:h:T;
N=numel(t);  
t(1)=0;
X(:,1)=[0 0 0 0]';
b0=0;b1=0;b2=40*Ki ;b3=130*Kp;b4=130*Kp;
a1=200 ;a2= -1.5152 + 39394*Kd ; a3=130*Kp; a4=-130;

f0=b0;
f1=b1-a1*f0;
f2=b2-a2*f0-a1*f1;
f3=b3-a3*f0-a2*f1-a1*f2;
f4=b4-a4*f0-a3*f1-a2*f2-a1*f3;
A=[ 0 1 0 0;0 0 1 0; 0 0 0 1;  -a1 -a2 -a3 -a4];
B=[f1;f2;f3;f4];


for i=1:N
X(:,i+1)=X(:,i)+(h)*(A*X(:,i)+B);
t(i+1)=t(i)+h;
end

alf = -(log(0.05)/0.6);
Xe = 1 - exp(-alf*t);
r = sum((Xe - X(1,:)).^2);

plot(t,Xe)
