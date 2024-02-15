clc
clear all
close all
w=-100:0.001:100;
FChH = -atan((w)./(-200.9800)) - atan((w-14)./(0.27)) - atan((w-14)./(0.27))
figure
plot(w,FChH),grid on, xlabel('Re'),ylabel('Im'),title('ФЧХ замкнутой нескорректированной системы')