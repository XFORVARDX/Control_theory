clc
clear all
close all
w=-100:0.001:100;
W=(130)./(-0.0033*i.*w.^3+0.665.*w.^2+i.*w+130);
WR=real(W);
WI=imag(W);
AChH=sqrt(WR.^2+WI.^2);
figure
plot(w,AChH),grid on, xlabel('Re'),ylabel('Im'),title('АЧХ замкнутой нескорректированной системы')