function [x, list, iterations] = Steffensons_Method(f, x_guess, num_trials)

% Follows Same style as Newtons Method
% Replaces the derivative with difference approximation: Theta
% Notation: x is x_k and x_new is x_k+1

% How fast does this converge - Quadratic? 

x = x_guess;
list = x_guess;
iterations = 0;

while iterations < num_trials
    fx = f(x);
    % evaluate Theta
    thetax = (f(x + f(x)) - f(x))/ f(x);

    if abs(thetax) < eps 
        print("Division by Zero Error in Theta");
        break;
    end 

    %evaluate next iteration
    x_new = x - fx/thetax; 
    iterations = iterations + 1;
    list = [list, x_new]; 

    if abs(f(x_new)) < eps
        x = x_new;
        break;
    end 
    
    % update old iteration
    x = x_new;
end 
end