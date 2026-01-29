figure; % Plots 
hold on; 
rho1_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
x_guess = 0.5; 
num_trials = 100; 

% Question 1 - what happens as rho -> 0 for newtons method 
fprintf("\n (NEWTONS) Coalescing Roots as rho1 -> 0 and Initial Guess: %f \n", x_guess);
for i = 1:length(rho1_values)
    rho1 = rho1_values(i);
    f = @(x) x*(x-rho1)*(x-rho2); 
    df = @(x) (3*x^2)-(2*x*rho2)-(2*x*rho1)+(r1*rho2); 
    
    [root, progress, iterations] = Newtons_Method(f, df, x_guess, 1, num_trials); 
    
    fprintf('Rho1: %f |  Iterations: %d | Root: %f\n', rho1, iterations, root);

    % Calculate absolute error at each step
    errors = abs(progress - root);    
    % Semiology Plot to show convergence Decay 
    semilogy(errors, '-o', 'DisplayName', ['rho1 = ', num2str(rho1)]);
end

grid on; % Plot Labels
xlabel('Iteration Number');
ylabel('Absolute Error |x_k - x^*|');
title('Newton''s Method: Root Coalescence as rho1 -> 0');
legend;
% These plots allow us to see how the Convergence Slows down 

% Question 2 - How is Newtons Method affected with rho1 and rho2 -> 0 
% Next we want to examine what happens as rho1 and rho2 go to zero. 
figure;  
hold on; 
scalar_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
fprintf(" (NEWTONS) Coalescing Roots as rho1 -> 0 and Initial Guess: %f \n", x_guess);

for i = 1:length(rho1_values)
    scalar = scalar_values(i); 
    rho1 = scalar; % Using this loop we are able to have both go to zero at the same time 
    rho2 = 2*scalar;
    
    % functions 
    f = @(x) x*(x-rho1)*(x-rho2); 
    df = @(x) (3*x^2)-(2*x*rho2)-(2*x*rho1)+(r1*rho2); 
    
    % Newtons Method function call 
    [root, progress, iterations] = Newtons_Method(f, df, x_guess, 1, num_trials); 
    
    fprintf('Rho1: %f |  Rho2: %f |  Iterations: %d | Root: %f\n', rho1, rho2, iterations, root);

    % Calculate absolute error at each step
    errors = abs(progress - root);    
    % Semiology Plot to show convergence Decay 
    semilogy(errors, '-d', 'DisplayName', ['rho1 = ', num2str(rho1), 'rho2 =', num2str(rho2)]);
end

grid on; % Plot Labels
xlabel('Iteration Number');
ylabel('Absolute Error |x_k - x^*|');
title('Newton''s Method: Root Coalescence as rho1 & rho2 -> 0');
legend;

% Question 3 - How is the Secant Method affected for both situations 
% first we will exmaine what happens as rho1 -> 0 for Secant Method

%plot requirements 
figure;  
hold on; 

% Parameters 
rho1_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
x_guess1 = -0.5;
x_guess2 = 0.5; 

% Begins Test 
fprintf("\n (SECANT) Coalescing Roots as rho1 -> 0 and Initial Guesses: %f \n", x_guess1, x_guess2);
for i = 1:length(rho1_values)
    rho1 = rho1_values(i);
    f = @(x) x*(x-rho1)*(x-rho2); 
    
    % Secant Method Function Call
    [root, progress, iterations] = Secant_Method(f,x_guess1,x_guess2,num_trials); 
    
    fprintf('Rho1: %f |  Iterations: %d | Root: %f\n', rho1, iterations, root);

    % Calculate absolute error at each step
    errors = abs(progress - root);    
    % Semiology Plot to show convergence Decay 
    semilogy(errors, '-o', 'DisplayName', ['rho1 = ', num2str(rho1)]);
end

grid on; % Plot Labels
xlabel('Iteration Number');
ylabel('Absolute Error |x_k - x^*|');
title('Secant Method: Root Coalescence as rho1 -> 0');
legend;

% Secant Testing - How is Secant Method affected with rho1 and rho2 -> 0 
figure;  
hold on; 
scalar_values = [5, 2, 0.1, 0.01, 0.001, 0.0001, 0.00001]; 
fprintf(" (SECANT) Coalescing Roots as rho1 -> 0 and Initial Guess: %f \n", x_guess);

for i = 1:length(rho1_values)
    scalar = scalar_values(i); 
    rho1 = scalar; % Using this loop we are able to have both go to zero at the same time 
    rho2 = 2*scalar;
    
    % functions 
    f = @(x) x*(x-rho1)*(x-rho2); 
    
    % Newtons Method function call 
    [root, progress, iterations] = Secant_Method(f,x_guess1,x_guess2,num_trials); 
    
    fprintf('Rho1: %f |  Rho2: %f |  Iterations: %d | Root: %f\n', rho1, rho2, iterations, root);

    % Calculate absolute error at each step
    errors = abs(progress - root);    
    % Semiology Plot to show convergence Decay 
    semilogy(errors, '-d', 'DisplayName', ['rho1 = ', num2str(rho1), 'rho2 =', num2str(rho2)]);
end

grid on; % Plot Labels
xlabel('Iteration Number');
ylabel('Absolute Error |x_k - x^*|');
title('Secant Method: Root Coalescence as rho1 & rho2 -> 0');
legend;

