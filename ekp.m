q=[4]; 
p= [1 4 20]; 
t=[0:0.01:5];
sys=tf(q,p)
h=step (sys, t);
plot(t, h); grid on, xlabel ('Time(sec)'), ylabel('h(t)')

