% Task 1 Tester File 
% Consider the problem of the form: f(x) = (x-p)^d 
% This contains a single root at p of multiplicity d

% 1) Standard Newton Method (m=1) - Quadratic Conv
x_guess = 1; % Test on multiple guess
m = 1; 
p = 0; % Root at p 
num_trials = 100;
fprintf("\n Standard Newton Method (m=1, d=2,3,...)\n");

% Next we will loop over d and call the function:
for d = 2:25
    % Define the function f(x) and its derivative
    f = @(x) (x - p)^d;
    df = @(x) d*(x-p)^(d-1);

    % Store the Results 
    [root, newton_progress, iterations] = Newtons_Method(f,df,x_guess,m,num_trials);

    % display the roots and how long they took 
    fprintf('d= %d | Iterations: %d | Root: %f\n', d, iterations, root);
end 

% 2) Modified Newtons Method (m=d) - Minimum Quadratic Conv ... TBD
fprintf("\n Modified Newton Method (m=d=2,3,...) \n")

% Loop over d and call the function:
for d = 2:25
    m = d; % Insert m = d conditional 
    % Define the function f(x) and its derivative
    f = @(x) (x - p)^d;
    df = @(x) d*(x-p)^(d-1);

    % Store the Results 
    [root, modified_newton_progress, iterations] = Newtons_Method(f,df,x_guess,m,num_trials);

    % display results
    fprintf('d= %d  | Iterations: %d  | Root: %f\n', d, iterations, root);
end 

% 3) Steffensons Method - Does this appear Quadratic (I think yes)
% - Converges just barely slower than standard newtons method 

fprintf("\n Steffensons Method (d = 2,3,...)\n")

% Loop over d and call the function:
for d = 2:25
    % Define the function f(x) 
    f = @(x) (x - p)^d;    
    % Store the Results 
    [root, steffenson_progress, iterations] = Steffensons_Method(f, x_guess, num_trials);
    
    % display results
    fprintf('d= %d  | Iterations: %d  | Root: %f\n', d, iterations, root);
end

% 4 + 5) Regula Falsi & Secant Method for d = 1,2,3,...
% Pay attention to the difference between d = 1 vs d = 2,3,,...
% starting interval [-1,1] for root 0
a = -1; 
b = 1; 

% RF METHOD
fprintf("\n Regula Falsi (d = 1,2,3,...)\n");
for d = 1:25
    % Define the function 
    f = @(x) (x - p)^d;    
    % Store the Results 
    [root, regulafalsi_progress, iterations] = RegulaFalsi_Method(f,a,b,num_trials);
    
    % display results
    fprintf('d= %d  | Iterations: %d  | Root: %f\n', d, iterations, root);
end

% SECANT METHOD
fprintf("\n Secant Method (d = 1,2,3,...) \n");

% Initial Guess for root at 0
x_guess1 = -1;
x_guess2 = 1; 

for d = 1:25
    % Define the function 
    f = @(x) (x - p)^d;    
    % Store the Results 
    [root, secant_progress, iterations] = Secant_Method(f,x_guess1,x_guess2,num_trials);
    
    % display results
    fprintf('d= %d  | Iterations: %d  | Root: %f\n', d, iterations, root);
end

% 6) Modified Newtons Method (d >= 2, m != d,)
% - 2 Cases: m > d, and m < d

fprintf("\n Modified Newton Method (m < d) \n");

for d = 2:11
    for m=1:(d-1) % Recall m=1 to start 
        % Define the function f(x) and its derivative
        f = @(x) (x - p)^d;
        df = @(x) d*(x - p)^(d - 1);
        
        % Store the Results 
        [root, modified1_newton_progress, iterations] = Newtons_Method(f, df, x_guess, m, num_trials);
        
        % display results
        fprintf('m = %d, d= %d  | Iterations: %d  | Root: %f\n', m, d, iterations, root);
    end
end


fprintf("\n Modified Newton Method (m > d) \n");

for m = 2:11
    for d =1:(m-1) % Recall = 1 
        % Define the function f(x) and its derivative
        f = @(x) (x - p)^d;
        df = @(x) d*(x - p)^(d - 1);
        
        % Store the Results 
        [root, modified2_newton_progress, iterations] = Newtons_Method(f, df, x_guess, m, num_trials);
        
        % display results
        fprintf('m = %d, d= %d  | Iterations: %d  | Root: %f\n', m, d, iterations, root);
    end
end

% Reminder: Test on multiple starting points for each Methdod
% Look at the progress from each method and compare them
% Some type of chart to visiualize the results (Speed of convergence)

% Calculate Error of each method 

newton_error = abs(newton_progress - p);
modified_newton_error = abs(modified_newton_progress - p);
steffenson_error = abs(steffenson_progress - p);
regulafalsi_error = abs(regulafalsi_progress - p);
secant_error = abs(secant_progress - p);

% modified Newton for m < d 
modified1_newton_error = abs(modified1_newton_progress - p);
%modified Newton for m < d
modified2_newton_error = abs(modified2_newton_progress - p);

