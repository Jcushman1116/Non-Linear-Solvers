% Task 3 - Problem 6.3 
% - Things to consider from the Solutions

% Consdier the function f(x) = x^2-x-2 with roots at -1 and 2
f = @(x) (x^2)-x-2; 

% Consider three Iterations:
% phi1 = x^2 - 2
phi1 = @(x) x^2 - 2;

% phi2 = sqrt(2+x)
phi2 = @(x) sqrt(2+x); 

% phi3 = -sqrt(2+x)
phi3 = @(x) -sqrt(2 + x);  

% Initial Guess

initial_guess = [-1.5, -1.000001, 0, 1.5, 2.000001, 3, 10]; 
num_trials = 25; 

% Initialize arrays to store results
results_phi1 = zeros(num_trials, 1);
results_phi2 = zeros(num_trials, 1);
results_phi3 = zeros(num_trials, 1);

for x0 = initial_guess
    x = x0; % Set initial guess for the iteration
    fprintf("\n Testing for Initial Guess: %f\n", x0); 

    % Test First Itertaion
    fprintf("\n Iteration 1 \n"); 
    for i=1:num_trials
        results_phi1(i) = x; 
        x = phi1(x);
        fprintf("Iteration: %d | x = %f \n",i, x);
    end 

    x=x0; 
    % Test Second Itertaion
    fprintf("\n Iteration 2 \n"); 
    for i=1:num_trials
        results_phi2(i) = x; 
        x = phi2(x);
        fprintf("Iteration: %d | x = %f \n",i, x); 
    end 

    x = x0; 
    % Test Third Itertaion
    fprintf("\n Iteration 3 \n");
    for i=1:num_trials
        results_phi3(i) = x; 
        x = phi3(x);
        fprintf("Iteration: %d | x = %f \n",i, x); 
    end 
end 
