% Task 2.1: Three Distinct Roots 
% Cubic Polynomial: f(x) = x(x-p)(x+p) with roots: 0, p>0, and -p

% Dertivative f'(x) = 3(x-a)(x+a) with roots: a = p/sqrt(3) > 0

% Analyze Newtons method for 
    % case a): x > p
    % case b): a < x < p 
    % case c): -c < x < c where c is the "cycling point for f(x)"

m = 1; % Standard Newton 
p = 2; %starting point 
num_trials = 20; 

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

% Question 3: Newton's iteration moving far away yet converging
% We pick a point extremely close to the local maximum alpha.
% This makes the derivative near-zero, shooting x1 to a huge value.
x_near_alpha = alpha + 1e-6; 
fprintf("Newton behavior near alpha (slope approx 0): x0 move far away \n"); 
[case35_root, progress35, iterations35] = Newtons_Method(f, df, x_near_alpha, m, num_trials); % More trials to allow recovery
fprintf("Initial x0: %f | Root found: %f | Iterations: %d \n", x_near_alpha, case35_root, iterations35);
disp(progress35)

% Question 4: Forcing Newton to fail (Undefined/Inf)
% We set x0 exactly to alpha so the derivative df(alpha) is exactly 0.
fprintf("Newton behavior with x0 = alpha (Division by Zero): \n"); 
[case36_root, progress36, iterations36] = Newtons_Method(f, df, alpha, m, num_trials);
fprintf("Root: %f | Iterations: %d \n", case36_root, iterations36);
disp(progress36)

% Next we will compare the Other iterative methods 
% Regula Falsi: 

fprintf("Regula Falsi Testing \n")

% Recall roots at -2,0,2
a = -3; 
b = -1; 
fprintf("Test Interval 1: ")
disp([a,b])

[case9_root, progress9, iterations9] = RegulaFalsi_Method(f, a, b ,num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case9_root, iterations9);
disp(progress9);

a = -1; 
b = 1;
fprintf("Test Interval 2: ")
disp([a,b])

[case10_root, progress10, iterations10] = RegulaFalsi_Method(f, a, b ,num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case10_root, iterations10);
disp(progress10);

a = 1; 
b = 3; 
fprintf("Test Interval 3: ")
disp([a,b])

[case11_root, progress11, iterations11] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case11_root, iterations11);
disp(progress11);

a = -3;
b = 1; 
fprintf("Test Interval 4: ")
disp([a,b])

[case12_root, progress12, iterations12] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case12_root, iterations12);
disp(progress12);

a = -1;
b = 3; 
fprintf("Test Interval 5: ")
disp([a,b])

[case13_root, progress13, iterations13] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case13_root, iterations13);
disp(progress13);

a = -3; 
b = 3; 
fprintf("Test Interval 6: ")
disp([a,b])

[case14_root, progress14, iterations14] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case14_root, iterations14);
disp(progress14);

a = -3; 
b = -4; 
fprintf("Test Interval 7: ")
disp([a,b])

[case15_root, progress15, iterations15] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case15_root, iterations15);
disp(progress15);

a = 3; 
b = 4; 
fprintf("Test Interval 8: ")
disp([a,b])

[case16_root, progress16, iterations16] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case16_root, iterations16);
disp(progress16);

a = -p/sqrt(5);
b = p/sqrt(5); 
fprintf("Test Interval 8: ")
disp([a,b])

[case17_root, progress17, iterations17] = RegulaFalsi_Method(f, a, b, num_trials); 
fprintf("Regula Falsi Root: %f | Iterations: %d \n", case17_root, iterations17);
disp(progress17);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Testing Steffenson Method: Uses the same information as Newtons Methods
% we will use the same intervals as interest as with Newtons Method


% Case 18 Function Call
fprintf("Steffensons behavior on the Interval: x > p \n"); 
[case18_root, progress18, iterations18] = Steffensons_Method(f,x_guess1,num_trials);
fprintf("root: %f |  Iterations: %d \n: ", case18_root , iterations18); 
disp(progress18)

% Question 5: Steffensen vs Newton Convergence Comparison
% Testing if Steffensen is as fast as Newton on the same starting point
fprintf("Comparing Newton vs Steffensen on x_guess1: \n");
fprintf("Newton Iterations: %d \n", iterations1);
fprintf("Steffensen Iterations: %d \n", iterations18);

%Case 19 Function Call
fprintf("steffenson behavior on the Interval: a < x < p \n"); 
[case19_root, progress19, iterations19] = Steffensons_Method(f, x_guess2, num_trials);
fprintf("root: %f |  Iterations: %d \n ", case19_root, iterations19);
disp(progress19)

% Case 20 Function Call % need to adjust the cycling interval for steffen 
fprintf("Steffenson behavior on the Interval: -c < x < c \n"); 
[case20_root, progress20, iterations20] = Steffensons_Method(f, x_guess3, num_trials);
fprintf("root: %f |  Iterations: %d \n", case20_root, iterations20);
disp(progress20)

% Question 2:
x_cycle = p/sqrt(5); % what happens when we use steffensons method on the cycling point

fprintf("steffenson behavior for x0 = c (cycling point) \n"); 
[case21_root, progress21, iterations21] = Steffensons_Method(f,x_cycle,num_trials);
fprintf("root: %f |  Iterations: %d \n", case21_root, iterations21);
disp(progress21)

fprintf("steffenson behavior for x0 = alpha \n"); 
[newcase_root, newprogress, newiterations] = Steffensons_Method(f,alpha,num_trials);
fprintf("root: %f |  Iterations: %d \n", newcase_root, newiterations);
disp(newprogress)

% What if we perturb the cycling point 
% Perturb the cycling point slightly

fprintf("Steffenson Bahvior for Perturbed cycling point: x0 + eps \n")
for n=1:10 % Makes each purtubation smaller % can go higher than 10 i think 
    pertubation = (1/10)^n; % .1, .01, .001, ...
    x_cycle_perturbed = x_cycle + pertubation; 
    [case22_root, progress22, iterations22] = Steffensons_Method(f, x_cycle_perturbed, num_trials);
    fprintf("pertubation size: %.10f | root after perturbation: %f |  Iterations: %d \n", pertubation, case22_root, iterations22);
    disp(progress22);
end 

fprintf("steffenson Bahvior for Perturbed cycling point: x0 - eps \n")
for n=1:10 % Makes each purtubation smaller % can go higher than 10 i think 
    pertubation = (1/10)^n; % .1, .01, .001, ...
    x_cycle_perturbed = x_cycle - pertubation; 
    [case23_root, progress23, iterations23] = Steffensons_Method(f, x_cycle_perturbed, num_trials);
    fprintf("pertubation size: %.10f | root after perturbation: %f |  Iterations: %d \n", pertubation, case23_root, iterations23);
    disp(progress23);
end 

% 4) can we make steffenson method fail by producing numbers too large

% first let the initial guess be the largest possible 
% double precision floating number 

fprintf("steffenson Behavior for Largest Double precision float: \n"); 
x_realmax_double = realmax('double'); %realmax is largest double prec num
[case24_root, progress24, iterations24] = Steffensons_Method(f, x_realmax_double, num_trials);
fprintf("Root: %.10f | Iterations: %d \n", case24_root, iterations24);
disp(progress24);

fprintf("steffenson Behavior for Largest Single precision float: \n"); 
x_realmax_single = realmax('single'); %realmax is largest double prec num
[case25_root, progress25, iterations25] = Steffensons_Method(f, x_realmax_single, num_trials);
fprintf("Root: %.10f | Iterations: %d \n", case25_root, iterations25);
disp(progress25);

% Thus showing a counterexample for when newtons method fails due to a
% large starting point, AKA realmax in Matlab 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf("Secant Method Testing \n")

% Recall roots at -2,0,2
a = -3; 
b = -1; 
fprintf("Test Interval 1: ")
disp([a,b])

[case26_root, progress26, iterations26] = Secant_Method(f, a, b ,num_trials); 
fprintf("Root: %f | Iterations: %d \n", case26_root, iterations26);
disp(progress26);

a = -1; 
b = 1;
fprintf("Test Interval 2: ")
disp([a,b])

[case27_root, progress27, iterations27] = Secant_Method(f, a, b ,num_trials); 
fprintf("Root: %f | Iterations: %d \n", case27_root, iterations27);
disp(progress27);

a = 1; 
b = 3; 
fprintf("Test Interval 3: ")
disp([a,b])

[case28_root, progress28, iterations28] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case28_root, iterations28);
disp(progress28);

a = -3;
b = 1; 
fprintf("Test Interval 4: ")
disp([a,b])

[case29_root, progress29, iterations29] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case29_root, iterations29);
disp(progress29);

a = -1;
b = 3; 
fprintf("Test Interval 5: ")
disp([a,b])

[case30_root, progress30, iterations30] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case30_root, iterations30);
disp(progress30);

a = -3; 
b = 3; 
fprintf("Test Interval 6: ")
disp([a,b])

[case31_root, progress31, iterations31] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case31_root, iterations31);
disp(progress31);

a = -3; 
b = -4; 
fprintf("Test Interval 7: ")
disp([a,b])

[case32_root, progress32, iterations32] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case32_root, iterations32);
disp(progress32);

a = 3; 
b = 4; 
fprintf("Test Interval 8: ")
disp([a,b])

[case33_root, progress33, iterations33] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case33_root, iterations33);
disp(progress33);

a = -p/sqrt(5);
b = p/sqrt(5); 
fprintf("Test Interval 8: ")
disp([a,b])

[case34_root, progress34, iterations34] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case34_root, iterations34);
disp(progress34);% Secant Testing

a = -alpha; 
b = alpha; 

[case35_root, progress35, iterations35] = Secant_Method(f, a, b, num_trials); 
fprintf("Root: %f | Iterations: %d \n", case34_root, iterations34);
disp(progress34);% Secant Testing

