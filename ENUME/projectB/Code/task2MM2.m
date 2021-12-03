interval = [-5, 10];
rootBrackets = rootBracketing(@polynomial, interval(1), interval(2));

printGraph(@polynomial, 'MM2', @mm2, interval, rootBrackets, 'Approximate zeros of function for method of ');
    
printComplexGraph(@polynomial, 'MM2', @mm2, [-1+i, 0], 'Aproximate complex roots of polynomial');

% the polynomial function for task 2
function y = polynomial(x)
    y = -2 * x^4 + 12 * x^3 + 4* x^2 + 1 * x + 3;
end

% find roots of polynomial using MM2
function [approx, steps] = mm2(func, a, b, tolerance)
    % define current and (dummy) previous approximation point
    approx = (a + b) / 2;
    
    % initialize output
    steps = [approx; func(approx)];
    
    % iterate algorithm until the error is within tolerance
    % the error is defined as the diff between the prev and the current approx

    func(approx)
    while abs(func(approx)) > tolerance
        % calculate approximating parabola using first and second derivative
        c = func(approx);
        b = deriv(func, approx, 1);
        a = deriv(func, approx, 2) / 2;
        
        % find roots of parabola
        zplus = -2 * c / (b + sqrt(b ^ 2 - 4 * a * c));
        zminus = -2 * c / (b - sqrt(b ^ 2 - 4 * a * c));
        
        % choose root closer to current approximation
        if abs(zplus) < abs(zminus)
            newapprox = approx + zplus;
        else
            newapprox = approx + zminus;
        end
        
        % update answer and prev approx
        prevapprox = approx;
        approx = newapprox;
        steps(:, size(steps, 2) + 1) = [approx, func(approx)];
    end
end
