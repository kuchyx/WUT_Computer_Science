% automatic step size variant of RK4
function [x, sizes, errors] = RK4Automatic(equations, initialValues, interval, initialStepSize, relativeEpsilon, absoluteEpsilon)
    % set start points of output
    args = interval(1);
    x = initialValues;
    
    % initialize output plots
    sizes = double.empty();
    errors = double.empty();
    
    % integrate function until end of interval reached
    stepsize = initialStepSize;
    step = 0;
    while 1
        % obtain the preceding function values
        step = step + 1;
        stepval = x(:, step);
        
        % advance output function
        for eqnum = 1:size(equations, 1)
            % generic single-step iteration
            phi = RK4Phi(equations{eqnum}, stepval, stepsize);
            x(eqnum, step + 1) = x(eqnum, step) + stepsize * phi;
        end
        
        % stop algorithm if function integrated over the whole interval
        args(step + 1) = args(step) + stepsize;
        if args(end) >= interval(2); break; end
        
        % also calculate next step using two half-steps
        for substep = 1:2
            for eqnum = 1:size(equations, 1)
                phi = RK4Phi(equations{eqnum}, stepval, stepsize / 2);
                stepval(eqnum) = stepval(eqnum) + (stepsize / 2) * phi;
            end
        end
        
        % calculate step correction factor
        alpha = Inf;
        for eqnum = 1:size(equations, 1)
            % calculate approximation error
            delta = abs(stepval(eqnum) - x(eqnum, step + 1)) / 15;
            errors(step) = delta;
            
            % calculate equation-specific alpha
            epsilon = abs(stepval(eqnum)) * relativeEpsilon + absoluteEpsilon;
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
