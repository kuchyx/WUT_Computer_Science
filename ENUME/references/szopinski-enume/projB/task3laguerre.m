% ENUME MICHAŁ SZOPIŃSKI
% PROJECT B NUMBER 60
% TASK 3
% https://github.com/Lachcim/szopinski-enume

% use Newton's algorithm to find roots of polynomial
algorithms = {'Laguerre''s algorithm', @laguerre};
interval = [1, 7];
brackets = rootbrac(@polynomial, interval(1), interval(2));
printroots(@polynomial, algorithms, interval, brackets, ...
    'Approximate real roots of polynomial', 'realroots');
printcomplex(@polynomial, algorithms, [-1+i, 0], ...
    'Approximate complex roots of polynomial', 'complexroots');

function [zero, steps] = laguerre(func, a, b, tolerance)
    % define hardcoded degree
    deg = 4;
    
    % define current and (dummy) previous approximation point
    zero = (a + b) / 2;
    prevzero = zero + b - a;
    
    % initialize output
    steps = [zero; func(zero)];
    
    % iterate algorithm until the error is within tolerance
    while abs(zero - prevzero) > tolerance
        % calculate derivatives
        deriv0 = func(zero);
        deriv1 = deriv(func, zero, 1);
        deriv2 = deriv(func, zero, 2);
        
        % calculate the square root in Laguerre's formula
        lagsqrt = sqrt( ...
            (deg - 1) * ((deg - 1) * deriv1 ^ 2 - deg * deriv0 * deriv2) ...
        );
        
        % calculate two possible values
        zplus = deg * deriv0 / (deriv1 + lagsqrt);
        zminus = deg * deriv0 / (deriv1 - lagsqrt);
        
        % choose value closer to current approximation
        if abs(zplus) < abs(zminus)
            newzero = zero - zplus;
        else
            newzero = zero - zminus;
        end
        
        % update answer
        prevzero = zero;
        zero = newzero;
        steps(:, size(steps, 2) + 1) = [zero, func(zero)];
    end
end
