% solve ODE system using RK4 with constant step size
function [x, derivs] = rk4(functs, init, interval, stepsize, maxsteps)
    % set initial values as start points of output
    x = init;
    
    % build derivatives table
    derivs = zeros(size(x));
    for eqnum = 1:size(functs, 1)
        derivs(eqnum, 1) = functs{eqnum}(x(:, 1));
    end
    
    % build output based on preceding values
    stepcount = ceil((interval(2) - interval(1)) / stepsize);
    if nargin >= 5; stepcount = min(stepcount, maxsteps - 1); end
    for step = 1:stepcount
        % obtain the preceding function values
        stepval = x(:, step);
        
        for eqnum = 1:size(functs, 1)
            % generic single-step iteration
            phi = rk4phi(functs{eqnum}, stepval, stepsize);
            x(eqnum, step + 1) = x(eqnum, step) + stepsize * phi;
            
            % update derivatives table
            derivs(eqnum, step + 1) = functs{eqnum}(x(:, step + 1));
        end
    end
    
    % append arguments to output
    x = [interval(1):stepsize:(stepcount * stepsize); x];
end
