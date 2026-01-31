% Task 4 - Problem 6.10 (b) & (c)

% Consider the system of equations: x^2 + y^2 = 4 & e^x + y = 1

% G1 will find a root if 0 < x0 < sqrt(2) and -2 < y0 < 0
% Should converge to right root  
% Due to the invariant domain via a contration Mapping 
% The spectral radius of the Jacobian of G1 is also < 1 
% The applying Banach's Fixed Point Theorem => Convergence Garuanteed 
% Additionally the left root  is a repelling fixed point for G1

% G2 will find a root -2 < x0 < 0 and -2 < y0 < 2 
% Should converge to left root 
% Due to the invariant domain via a contration Mapping 
% The spectral radius of the Jacobian of G2 is also < 1 
% Additionally the right root is a repelling fixed point for G2

% Local Parameters 
num_trials = 20; 

% Define the Iteration G1 and G2 
G1 = @(x,y) [log(1-y); -sqrt(4-x^2)];
G2 = @(x,y) [-sqrt(4-y^2); 1 - exp(x)];

% Test Intervals for G1: everything should converge expect last Interval 
G1_intervals = [ 0.5, -0.5;
                 1.0, -1.0;
                 sqrt(2) - 0.1, -0.1;
                 2.0, 1.0 ];

% Test Intervals for G2: all should converge expect last one
G2_intervals = [-1.5, 1.5;
                -1.0, 1.0;
                -1.99, 1.99;
                -3.0, 3.0 ]; 

fprintf('\n G1 Iterations \n'); 

for i =1:size(G1_intervals,1) % Loop through rows of Initial Guesses for G1 
    x = G1_intervals(i,1); % row i col 1
    y = G1_intervals(i,2); % row i col 2  

    fprintf("\n Initial Points: , x0 = %f, y0 = %f\n", x, y);
    G1_results = zeros(num_trials, 2); % Initialize storage of results

    % Start Iteration for G1 
    for j = 1:num_trials

        % Check for complex or undefined values 
        if (4-x^2 < 0) || (1-y <= 0)
            fprintf("Left real valued domain at iteration %d\n", j);
            break; 
        end

        % xy stores the new values of from the iteration  
        xy = G1(x,y); 
        x = xy(1); % update x
        y = xy(2); % update y 

        G1_results(j,:) = [x y]; % Store results for G1
        fprintf("Iteration: %d | x = %f | y = %f \n",j, x, y); 
    end
end 

% Testing G2 
fprintf('\n G2 Iterations \n'); 

for i =1:size(G2_intervals,1) % Loop through rows of Initial Guesses for G2 
    x = G2_intervals(i,1); % row i col 1
    y = G2_intervals(i,2); % row i col 2  

    fprintf("\n Initial Points: , x0 = %f, y0 = %f\n", x, y);
    G2_results = zeros(num_trials, 2); % Initialize storage of results

    % Start Iteration for G2
    for j = 1:num_trials

        % Check for complex or undefined values 
        if (4-y^2 < 0)
            fprintf("Left real valued domain at iteration %d\n", j);
            break; 
        end

        % xy stores the new values of from the iteration  
        xy = G2(x,y); 
        x = xy(1); % update x
        y = xy(2); % update y 
        G2_results(j,:) = [x y]; % Store results for G2
 
        fprintf("Iteration: %d | x = %f | y = %f \n",j , x, y); 
    end
end 

% Results for G1: 
% - Desired Intervals converged to (1.00 , -1.73) for G1
% - Undesireable Intervals feel outside of real valued domain 

% Results for G2: 
% - Desired Intervals converged to (-1.80 , 0.83) for G2
% - Undesireable Intervals feel outside of real valued domain 