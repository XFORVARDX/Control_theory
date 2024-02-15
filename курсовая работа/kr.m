f = @(s) s^3+34*s^2+350*s+81000;
df = @(s) 3*s^2+34*2*s+350;
ddf= @(s) 6*s+68;
x0 = -54;
epsilon = 1e-2;
max_iterations = 10000;
[x, iterations] = modified_newton_method(f, df, ddf, x0, epsilon, max_iterations);
disp(x);
disp(iterations);