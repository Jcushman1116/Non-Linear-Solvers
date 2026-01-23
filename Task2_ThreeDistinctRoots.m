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

x_cycle = p/sqrt(5); % derived

fprintf("Newton behavior for x0 = c (cycling point) \n"); 
[case4_root, progress4, iterations4] = Newtons_Method(f, df, x_cycle, m, num_trials);
fprintf("root: %f |  Iterations: %d \n", case4_root, iterations4);
disp(progress4)

% What if we perturb the cycling point 
% Perturb the cycling point slightly

fprintf("Newton Bahvior for Perturbed cycling point: x0 + eps \n")
for n=1:10 % Makes each purtubation smaller % can go higher than 10 i think 
    pertubation = (1/10)^n; % .1, .01, .001, ...
    x_cycle_perturbed = x_cycle + pertubation; 
    [case5_root, progress5, iterations5] = Newtons_Method(f, df, x_cycle_perturbed, m, num_trials);
    fprintf("pertubation size: %.10f | root after perturbation: %f |  Iterations: %d \n", pertubation, case5_root, iterations5);
    disp(progress5);
end 

fprintf("Newton Bahvior for Perturbed cycling point: x0 - eps \n")
for n=1:10 % Makes each purtubation smaller % can go higher than 10 i think 
    pertubation = (1/10)^n; % .1, .01, .001, ...
    x_cycle_perturbed = x_cycle - pertubation; 
    [case6_root, progress6, iterations6] = Newtons_Method(f, df, x_cycle_perturbed, m, num_trials);
    fprintf("pertubation size: %.10f | root after perturbation: %f |  Iterations: %d \n", pertubation, case6_root, iterations6);
    disp(progress6);
end 

% 3) skipped for now 

% 4) can we make newton method fail by producing numbers too large

% first let the initial guess be the largest possible 
% double precision floating number 

fprintf("Newton Behavior for Largest Double precision float: \n"); 
x_realmax_double = realmax('double'); %realmax is largest double prec num
[case7_root, progress7, iterations7] = Newtons_Method(f, df, x_realmax_double, m, num_trials);
fprintf("Root: %.10f | Iterations: %d \n", case7_root, iterations7);
disp(progress7);

fprintf("Newton Behavior for Largest Single precision float: \n"); 
x_realmax_single = realmax('single'); %realmax is largest double prec num
[case8_root, progress8, iterations8] = Newtons_Method(f, df, x_realmax_single, m, num_trials);
fprintf("Root: %.10f | Iterations: %d \n", case8_root, iterations8);
disp(progress8);

% Thus showing a counterexample for when newtons method fails due to a
% large starting point, AKA realmax in Matlab 

% Next we will compare the Other iterative methods 
% Regula Falsi: 

fprintf("Regula Falsi for L")
