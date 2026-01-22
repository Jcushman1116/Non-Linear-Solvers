% Task 2.1: Three Distinct Roots 
% Cubic Polynomial: f(x) = x(x-p)(x+p) with roots: 0, p>0, and -p

% Dertivative f'(x) = 3(x-a)(x+a) with roots: a = p/sqrt(3) > 0

% Analyze Newtons method for 
    % case a): x > p
    % case b): a < x < p 
    % case c): -c < x < c where c is the "cycling point for f(x)"

% Case Variables:
x_guess1 = 4; % x>p
x_guess2 = 1.5 ; % alpha < x < p 
x_guess3 = .75; % -c < x < c where eta is the cycling point

% what is the value of c:  

m = 1; % Standard Newton 

p = 2; %starting point 
num_trials = 10; 

fprintf("Newton behavior on the Interval: x > p \n"); 
alpha = p/sqrt(3);  
% Define the function 

f = @(x) x*(x-p)*(x+p); 
df = @(x) 3*(x-alpha)*(x+alpha);

% Case 1 Function Call
[case1_root, progress1, iterations1] = Newtons_Method(f,df,x_guess1,m,num_trials);
fprintf("root: %f |  Iterations: %d \n: ", case1_root , iterations1); 

fprintf("Newton behavior on the Interval: a < x < p \n"); 

%Case 2 Function Call
[case2_root, progress2, iterations2] = Newtons_Method(f, df, x_guess2, m, num_trials);
fprintf("root: %f |  Iterations: %d \n ", case2_root, iterations2);

% Case 3 Function Call
fprintf("Newton behavior on the Interval: -c < x < c \n"); 
[case3_root, progress3, iterations3] = Newtons_Method(f, df, x_guess3, m, num_trials);
fprintf("root: %f |  Iterations: %d \n", case3_root, iterations3);