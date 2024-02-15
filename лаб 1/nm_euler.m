% ������� ����� ������ 
clc; clear all
syms x t
a=diff(9*t^2*x-(t^5+t^2)*x^2,x,t);
f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;
dF = inline(a); % ����������� � �������

h=0.01; % ��� 
t=0:h:1; eps=0.0001; % ��������
n=length(t);
X=[1]; 
% ����������� �1 ����� �.������
X(2)=X(1)+h*f(t(1),X(1));

%����� ������� ��������
for j=2:n-1 % ���� �� n-� �
    x=[X(j)];
    del=1;
    i=0;
    while abs(del)>eps % ���� �� i-� �
        i=i+1;
        x(i+1)=X(j)+h*f(t(j),x(i));
        del=x(i+1)-x(i);
    end
    X(j+1)=x(i);
end 
x_n=X(end)
% ������� ���������� ���������
f=@(t,x)+9*t^2*x-(t^5+t^2)*x^2;

[t2,x2]=ode45(f,[0,1],1);
X_n=x2(end)
% ��������,%
eps1=abs(X_n-x_n)/abs(X_n)*100
plot(t,X,'b',t2,x2,'k','LineWidth',2)
grid on
legend('����� ������','���������� ��������')