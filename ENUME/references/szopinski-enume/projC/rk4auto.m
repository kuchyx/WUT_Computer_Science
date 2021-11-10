% ENUME MICHAŁ SZOPIŃSKI
% PROJECT C NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% automatic step size variant of RK4
function [x, sizes, errors] = rk4auto(functs, init, interval, initstep, eps_rel, eps_abs)
    % set start points of output
    args = interval(1);
    x = init;
    
    % initialize output plots
    sizes = double.empty();
    errors = double.empty();
    
    % integrate function until end of interval reached
    stepsize = initstep;
    step = 0;
    while 1
        % obtain the preceding function values
        step = step + 1;
        stepval = x(:, step);
        
        % advance output function
        for eqnum = 1:size(functs, 1)
            % generic single-step iteration
            phi = rk4phi(functs{eqnum}, stepval, stepsize);
            x(eqnum, step + 1) = x(eqnum, step) + stepsize * phi;
        end
        
        % stop algorithm if function integrated over the whole interval
        args(step + 1) = args(step) + stepsize;
        if args(end) >= interval(2); break; end
        
        % also calculate next step using two half-steps
        for substep = 1:2
            for eqnum = 1:size(functs, 1)
                phi = rk4phi(functs{eqnum}, stepval, stepsize / 2);
                stepval(eqnum) = stepval(eqnum) + (stepsize / 2) * phi;
            end
        end
        
        % calculate step correction factor
        alpha = Inf;
        for eqnum = 1:size(functs, 1)
            % calculate approximation error
            delta = abs(stepval(eqnum) - x(eqnum, step + 1)) / 15;
            errors(step) = delta;
            
            % calculate equation-specific alpha
            epsilon = abs(stepval(eqnum)) * eps_rel + eps_abs;
            eqalpha = epsilon / delta;
            
            % minimum alpha wins
            if eqalpha < alpha; alpha = eqalpha; end
        end
        alpha = alpha ^ (1/5);
        
        % correct step size with safety factor
        stepsize = 0.9 * alpha * stepsize;
        sizes(step) = stepsize;
    end
    
    % append arguments to output
    x = [args; x];
end
