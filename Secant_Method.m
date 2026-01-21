function [x2, list, iterations] = Secant_Method(f,x_guess1,x_guess2,num_trials)
% Different from Newton and Steffenson Method 
% Need 2 initial guesses to be close to interval for conv. 
% "Superlinear Q-Convergence Rate" 

%x1 = x^k-1
x1 = x_guess1;
%x = x^k
x2 = x_guess2;

%start the progress with both inital points 
list = [x1, x2]; 
iterations = 0; 

while iterations < num_trials
    fx1 = f(x1);
    fx2 = f(x2); 
    % compute q for iterations AKA slope
    q = (fx2 - fx1) / (x2 - x1);

    if abs(q) < eps
         fprintf("difference in iterations is approx zero, unable to divide \n");
       break;
    end

    % Update new value of x in iteration
    x_new =  x2 - (fx2/q); 
    iterations = iterations + 1; 
    list = [list, x_new];

    % Check for root
    if abs(f(x_new)) < eps 
        x2 = x_new; 
        break; %root has been found
    end 

    % Otherwise a root has not been found yet 
    % Update previous iterations to next iterations
    x1 = x2; 
    x2 = x_new;
end
end


