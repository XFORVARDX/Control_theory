clc; clear all
q=1292
v=26
T0=20
a=8.805
x=[-0.3:0.005:0]
y=0.006
l=42

T=-q.*exp((v.*(x.^2+y.^2))./(4.*a.*x))./(pi.*l.*x)+T0 ;
plot(x,T)