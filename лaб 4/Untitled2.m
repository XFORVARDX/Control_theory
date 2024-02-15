x = -3:0.2:3;
y = x'
f = x.^2 .* y.^3;
surf(x,y,f)
xlabel('x')
ylabel('y')
zlabel('z')