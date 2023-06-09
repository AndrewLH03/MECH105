function [fx, ea, iter] = bisectMethod(func, xL, xU, es, maxIt)
% bisectMethod: finds the root of a function using false position method
% Inputs:
%   func: passed function where root will be found on
%   xl: passed lower bound
%   xu: passed upper bound
%   es: stopping criteria
%   maxIt: maximum number of iterations
%   varargin: number of variables passed
% Outputs:
%   fx = y-value of root found
%   ea = approximate error found with root
%   iter = number of iterations to find root

% Function to find approximate error
approxError = @(xr, xrold) abs((xr - xrold) / xr) * 100;

%Declaring and intializing variables
iter = 0;
ea = 1;

% Ensuring that passed bounds contains a sign change
if func(xL) * func(xU) > 0
    error('No sign change detected')
end

% Sets default stopping criteria and maximum iterations if none is passed
if nargin < 6 && ~exist('es')
    es = 0.0001;
end
if nargin < 6 && ~exist('maxIt')
    maxIt = 200;
end

% Loop checking if the approx error or max iterations have been reached
while ea > es && iter < maxIt
    % Increment number of iterations
    iter = iter + 1;

    % If not the first iteration, calculate approx error
    if iter ~= 1
        xrold = root;
        ea = approxError(root,xrold);
    end

    % Calculate the root through bisection method
    root = (xL + xU) / 2;

    % Calculating y-values
    fx = func(root);
    yl = func(xL);

    % Checking for if the upper or lower bounds need to be changed
    if fx * yl < 0
        xU = root;
    else
        xL = root;
    end
end
end