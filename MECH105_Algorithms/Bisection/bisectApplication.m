format long

% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

% Define the function to be solved for. Is the angle specified in radians or degrees?
f = @(x) (mu * m * g) ./ (cos(deg2rad(x)) + (mu * sin(deg2rad(x)))) - 150;

% THINK, what makes range sense for angle?
xL = 0;
xU = 90;
es = 0.01;
maxIt = 250;

% Plot your function. Does plotting give you an idea about where the root is?
theta = linspace(0, 90, 1000);
plot(theta, f(theta))

% Finaly solve for the root using the bisection script given to you, which can be called as:
% [root, fx, ea, iter] = bisect(func, lower_bound, upper_bound);

[angle, fx, ea, iter] = bisectMethod(f, xL, xU, es, maxIt);

% These variables will be checked for your final answer:
% angle =  % the angle in degree that solves this problem
% fx =     % the function value at your solved angle
% ea =     % the bisection error estimate
% iter =   % the number of bisection iterations

% Printing out outputs
fprintf('Angle:  %f degrees\n', angle)
fprintf('Function Value: %f\n', fx)
fprintf('Error Estimate: %f\n', ea)
fprintf('Number of Iterations: %d\n', iter)