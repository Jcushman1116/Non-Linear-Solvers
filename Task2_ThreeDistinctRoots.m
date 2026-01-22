% Task 2.1: Three Distinct Roots 
% Cubic Polynomial: f(x) = x(x-p)(x+p) with roots: 0, p>0, and -p

% Dertivative f'(x) = 3(x-a)(x+a) with roots: a = p/sqrt(3) > 0

% Analyze Newtons method for 
    % case a): x > p
    % case b): a < x < p 
    % case c): -c < x < c where c is the "cycling point for f(x)"

m = 1; % Standard Newton 
p = 2; %starting point 
num_trials = 10; 

% Case Variables:
x_guess1 = 4; % x>p
x_guess2 = 1.5 ; % alpha < x < p 
x_guess3 = 0.5; % -c < x < c where c is the cycling point

% what is the value of c = p/sqrt(5) from solving Phi(x) = -x
alpha = p/sqrt(3);  
% Define the function 

f = @(x) x*(x-p)*(x+p); 
df = @(x) 3*(x-alpha)*(x+alpha);

% Question 1: Demonstrate the 3 cases 

% Case 1 Function Call
fprintf("Newton behavior on the Interval: x > p \n"); 
[case1_root, progress1, iterations1] = Newtons_Method(f,df,x_guess1,m,num_trials);
fprintf("root: %f |  Iterations: %d \n: ", case1_root , iterations1); 
disp(progress1)

%Case 2 Function Call
fprintf("Newton behavior on the Interval: a < x < p \n"); 
[case2_root, progress2, iterations2] = Newtons_Method(f, df, x_guess2, m, num_trials);
fprintf("root: %f |  Iterations: %d \n ", case2_root, iterations2);
disp(progress2)

% Case 3 Function Call
fprintf("Newton behavior on the Interval: -c < x < c \n"); 
[case3_root, progress3, iterations3] = Newtons_Method(f, df, x_guess3, m, num_trials);
fprintf("root: %f |  Iterations: %d \n", case3_root, iterations3);
disp(progress3)

% Question 2: What happens when x0 is the floating point rep of c

x_guess4 = p/sqrt(5); % derived

fprintf("Newton behavior for x0 = c (cycling point) \n"); 
[case4_root, progress4, iterations4] = Newtons_Method(f, df, x_guess4, m, num_trials);
fprintf("root: %f |  Iterations: %d \n", case4_root, iterations4);
disp(progress4)

% what if we perturb the cycling point by small amount 

x_guess4_perturbed = x_guess4 + perturbation;




