% Parameters 
rho1_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
rho2_fixed = 10; % Add a default rho2 
x_guess = 1; 
num_trials = 1000000; 

% Question 1 - what happens as rho -> 0 for newtons method 
figure; hold on;
fprintf("\n (NEWTONS) Coalescing Roots as rho1 -> 0 and Initial Guess: %f \n", x_guess);

for i = 1:length(rho1_values)
    rho1 = rho1_values(i);
    rho2 = rho2_fixed; 
    
    %  function and derivative
    f = @(x) x*(x-rho1)*(x-rho2); 
    df = @(x) (3*x^2) - 2*(rho1 + rho2)*x + (rho1*rho2); 
    
    [root, progress, iterations] = Newtons_Method(f, df, x_guess, 1e-10, num_trials); 
    
    fprintf('Rho1: %f |  Iterations: %d | Root: %f\n', rho1, iterations, root);
    errors = abs(progress - root);    
    semilogy(errors, '-o', 'DisplayName', ['rho1 = ', num2str(rho1)]);
end

grid on; xlabel('Iteration Number'); ylabel('Absolute Error |x_k - x^*|');
title('Newton''s Method: Root Coalescence as rho1 -> 0');
legend;

% Question 2 - How is Newtons Method affected with rho1 and rho2 -> 0 
figure; hold on; 
scalar_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
fprintf("\n (NEWTONS) Coalescing Roots as rho1 & rho2 -> 0 \n");

for i = 1:length(scalar_values)
    rho1 = scalar_values(i); 
    rho2 = 2 * scalar_values(i);
    
    f = @(x) x*(x-rho1)*(x-rho2); 
    df = @(x) (3*x^2) - 2*(rho1 + rho2)*x + (rho1*rho2); 
    
    [root, progress, iterations] = Newtons_Method(f, df, x_guess, 1e-10, num_trials); 
    
    fprintf('Rho1: %f |  Rho2: %f |  Iterations: %d | Root: %f\n', rho1, rho2, iterations, root);
    errors = abs(progress - root);    
    semilogy(errors, '-d', 'DisplayName', ['rho1=', num2str(rho1), ', rho2=', num2str(rho2)]);
end
grid on; xlabel('Iteration Number'); ylabel('Absolute Error |x_k - x^*|');
title('Newton''s Method: Root Coalescence as rho1 & rho2 -> 0');
legend;

% Question 3 - How is the Secant Method affected for rho1 -> 0
figure; hold on; 
x_guess1 = -0.5;
x_guess2 = 0.5; 
fprintf("\n (SECANT) Coalescing Roots as rho1 -> 0 \n");

for i = 1:length(rho1_values)
    rho1 = rho1_values(i);
    rho2 = rho2_fixed;
    f = @(x) x*(x-rho1)*(x-rho2); 
    
    [root, progress, iterations] = Secant_Method(f, x_guess1, x_guess2, num_trials); 
    
    fprintf('Rho1: %f |  Iterations: %d | Root: %f\n', rho1, iterations, root);
    errors = abs(progress - root);    
    semilogy(errors, '-o', 'DisplayName', ['rho1 = ', num2str(rho1)]);
end
grid on; xlabel('Iteration Number'); ylabel('Absolute Error |x_k - x^*|');
title('Secant Method: Root Coalescence as rho1 -> 0');
legend;

% Question 4 - Secant Method as rho1 and rho2 -> 0 
figure; hold on; 
fprintf("\n (SECANT) Coalescing Roots as rho1 & rho2 -> 0 \n");

for i = 1:length(scalar_values)
    rho1 = scalar_values(i); 
    rho2 = 2 * scalar_values(i);
    f = @(x) x*(x-rho1)*(x-rho2); 
    
    [root, progress, iterations] = Secant_Method(f, x_guess1, x_guess2, num_trials); 
    
    fprintf('Rho1: %f |  Rho2: %f |  Iterations: %d | Root: %f\n', rho1, rho2, iterations, root);
    errors = abs(progress - root);    
    semilogy(errors, '-d', 'DisplayName', ['rho1=', num2str(rho1), ', rho2=', num2str(rho2)]);
end
grid on; xlabel('Iteration Number'); ylabel('Absolute Error |x_k - x^*|');
title('Secant Method: Root Coalescence as rho1 & rho2 -> 0');
legend;