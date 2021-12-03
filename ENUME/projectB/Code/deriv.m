% calculate the nth derivative of func at x
function y = deriv(func, x, deg)
    % base case: zeroth derivative
    if deg == 0
        y = func(x);
        return
    end
    
    % recurse to find the nth derivative
    step = sqrt(eps);
    y = (deriv(func, x + step, deg - 1) - deriv(func, x - step, deg - 1)) / (2 * step);
end
