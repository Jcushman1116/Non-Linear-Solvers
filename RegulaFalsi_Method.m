function [x_new, list, iterations] = RegulaFalsi_Method(f, a_guess, b_guess, num_trials)
% [a,b] - inital interval
% f(a)*f(b) < 0 to ensure existence of a root
% Convergence should be linear 
a= a_guess;
b= b_guess; 

fa = f(a);
fb = f(b);

if fa * fb > 0
    fprintf("Unuseable interval \n")
end 

% start with a as that will be the first x value we use 
list = a;
iterations = 0; % Initialize iteration counter

% begin RF Method 
while iterations < num_trials
    q = (fb - fa)/ (b-a);
    % x can be a or b 
    x = a; 
    % Update iteration
    x_new = x - f(x)/q;

    iterations = iterations + 1; 
    list = [list, x_new];
    % evaluate new x value
    f_new = f(x_new);

    % Check for Convergence
    if (abs(f_new) < eps) || ((b-a) < eps)
        break; 
    end
    
    % Update interval based on the sign of f_new
    if fa * f_new < 0
        b = x_new; 
        fb = f_new; 
    else
        a = x_new; 
        fa = f_new; 
    end
end
%return x_new as it could be a or b 
end