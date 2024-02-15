function [x, iterations] = modified_newton_method(f, df, ddf, x0, epsilon, max_iterations)
    iterations = 0;
    x = x0;
    
    while abs(f(x)) > epsilon && iterations < max_iterations
        x = x - df(x) / ddf(x);
        iterations = iterations + 1;
    end
    
    if abs(f(x)) > epsilon
        disp('Метод не сошелся за заданное количество итераций.');
    else
        disp('Метод сошелся к решению:');
    end
end
