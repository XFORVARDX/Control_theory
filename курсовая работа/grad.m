clc 
clear all

del_Kp=0.0001; del_Kd=0.0001; del_Ki=0.0001;
T_mod=1000; N=20000000; h=T_mod/N; t(1)=0; 
for i=1:N 
t(i+1)=t(i)+h; 
end 
 K =[10.4745    2.0554    0.3543]
lyam=0.000000001; Kp=K(1); Kd=K(2); Ki=K(3);
P0=[Kp Kd Ki]'; 
P1(1,1)= P0(1,1)+del_Kp;
P1(2,1)= P0(2,1);
P1(3,1)= P0(3,1);
d_I1=(param(P1)-param(P0))/del_Kp;
P2(1,1)= P0(1,1);
P2(2,1)= P0(2,1)+del_Kd;
P2(3,1)= P0(3,1);
d_I2=(param(P2)-param(P0))/del_Kd;
P3(1,1)= P0(1,1);
P3(2,1)= P0(2,1);
P3(3,1)= P0(3,1)+del_Ki;
d_I3=(param(P3)-param(P0))/del_Ki;

GR=[d_I1 d_I2 d_I3]'; 
P=P0 - lyam*GR; 
while norm(P-P0,2)>0.1
P0=P; 
d_I1=(param(P1)-param(P0))/del_Kp;
d_I2=(param(P2)-param(P0))/del_Kd;
d_I3=(param(P3)-param(P0))/del_Ki;
 GR=[d_I1 d_I2 d_I3]'; 
P=P0 - lyam*GR; 
if (param(P0)< param(P))
lyam=lyam/2;
end 
end 
P
