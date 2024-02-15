syms s
clear all
eps=0.3
Imax=100
syms s
F = 0.0033*s^3 -0.665*s^2+s + 130;%здесь знаменатель с изображения
F1=diff(F,s)%производная
p = [0.0033 0.665 1 130]%полином
q=[130]
r=roots(p) %корни полинома 

x0 =-2.0198 + 0.0000*i%от какого корня отталкиваемся 

x(1) = x0 
i = 1

while (abs(x(i)-r(2))>eps)&&(i < Imax) 
    i = i+1;
    x(i) = x(i-1) - (subs(F,s,x(i-1)))/(subs(F1,s,x0))%формула метода Ньютона
    
end
