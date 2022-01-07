function x = adamspc(functs, init, interval, stepsize)
    % obtain first five steps from RK4
    [x, derivs] = rk4(functs, init, interval, stepsize, 5);
    x = x(2:end, :);
    
    % define coefficient tables
    beta = [1901, -2774, 2616, -1274, 251] / 720;
    betastar = [475, 1427, -798, 482, -173, 27] / 1440;
    
    % build output based on preceding values
    stepcount = ceil((interval(2) - interval(1)) / stepsize);
    for step = 6:(stepcount + 1)     
        % predict
        xpred = x(:, step - 1);
        for eqnum = 1:size(functs, 1)
            for prev = 1:5
                xpred(eqnum) = xpred(eqnum) ...
                    + stepsize * beta(prev) * derivs(eqnum, step - prev);
            end
        end
            
        % evaluate
        derivpred = zeros(size(functs, 1), 1);
        for eqnum = 1:size(functs, 1)
            derivpred(eqnum) = functs{eqnum}(xpred);
        end
            
        % correct
        x(:, step) = x(:, step - 1);
        for eqnum = 1:size(functs, 1)
            for prev = 1:5
                x(eqnum, step) = x(eqnum, step) ...
                    + stepsize * betastar(prev + 1) * derivs(eqnum, step - prev);
            end
            x(eqnum, step) = x(eqnum, step) ...
                + stepsize * betastar(1) * derivpred(eqnum);
        end
        
        % evaluate
        for eqnum = 1:size(functs, 1)
            derivs(eqnum, step) = functs{eqnum}(x(:, step));
        end
    end
    
    % append arguments to output
    x = [interval(1):stepsize:(stepcount * stepsize); x];
end
