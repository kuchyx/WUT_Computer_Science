% ENUME MICHAŁ SZOPIŃSKI
% PROJECT B NUMBER 60
% TASK 1
% https://github.com/Lachcim/szopinski-enume

% define available algorithms
algorithms = {
    'bisection', @bisect;
    'Newton''s algorithm', @newton
};

% find all root brackets
interval = [2, 11];
brackets = rootbrac(@taskfunc, interval(1), interval(2));

% find and graph zeros using both algorithms
printroots(@taskfunc, algorithms, interval, brackets, ...
    'Approximate zeros of function', 'zeros');

% use Newton's algorithm to find roots of polynomial
algorithms = {'Newton''s algorithm', @newton};
interval = [1, 7];
brackets = rootbrac(@polynomial, interval(1), interval(2));
printroots(@polynomial, algorithms, interval, brackets, ...
    'Approximate real roots of polynomial', 'realroots');
    
% the function as given in the task
function y = taskfunc(x)
    y = 0.7 * x * cos(x) - log(x + 1);
end

% uses the bisection algorithm to find the root of a function within the given bracket
function [zero, steps] = bisect(func, a, b, tolerance)
    % initialize empty array of steps
    steps = double.empty(2, 0);
    
    % iterate algorithm until the error is within tolerance
    while 1
        % calculate midpoint
        zero = (a + b) / 2;
        steps(:, size(steps, 2) + 1) = [zero, func(zero)];
        
        % stop test
        if abs(a - b) < tolerance; break; end
        
        % choose next sub-interval based on sign mismatch
        if sign(func(a)) ~= sign(func(zero))
            b = zero;
        else
            a = zero;
        end
    end
end

% uses Newton's algorithm to find the root of a function
function [zero, steps] = newton(func, a, b, tolerance)
    % initialize step array and calculate derivative step
    steps = double.empty(2, 0);
    step = sqrt(eps);
    
    % calculate first approximation of zero - midpoint of the bracket
    zero = (a + b) / 2;
    steps(:, size(steps, 2) + 1) = [zero, func(zero)];
    
    % iterate algorithm until the error is within tolerance
    while 1
        % calculate next approximation of zero
        prevzero = zero;
        derivative = (func(zero + step) - func(zero - step)) / (2 * step);
        zero = zero - func(zero) / derivative;
        steps(:, size(steps, 2) + 1) = [zero, func(zero)];
        
        % prevent divergence during approximation
        if zero < a || zero > b
            error('Divergent iteration');
        end
        
        % stop test
        if abs(zero - prevzero) <= tolerance; break; end
    end
end
