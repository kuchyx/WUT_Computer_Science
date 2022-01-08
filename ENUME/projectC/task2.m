% functions of the ODE system and initial values
sysfuncts = {
    @(x) x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2);
    @(x) -x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2)
};
initvalues = [0; 12];
interval = [0; 15];

% define available algorithms
algorithms = {
    'RK4', @RK4, [0.01, 0.013408];
    'Adams PC', @adamspc, [0.002, 0.01305]
};

% solve ODE using different algorithms and step sizes
for alg = 1 : 2
    [algname, algfunc, stepsizes] = algorithms{alg, :};
    
    % solve using the given algorithm for each step size
    stepresults = cell(size(stepsizes, 2), 3);
    stepnames = {'optimal step', 'larger step'};
    for stepno = 1:size(stepsizes, 2)
        result = algfunc(sysfuncts, initvalues, interval, stepsizes(stepno));
        stepresults(stepno, :) = { ...
            stepsizes(stepno), ...
            stepnames{stepno}, ...
            result};
    end
    
    % plot each component against time
    for eqnum = 1:size(sysfuncts, 1)
        % begin plot
        figure; grid on; hold on;
        title([algname, ', x_', num2str(eqnum), ' against time']);
        
        % plot component for each step size
        for stepresult = stepresults'
            plot(stepresult{3}(1, :), stepresult{3}(eqnum + 1, :));
        end
        
        % finish plot
        hold off;
        legend(stepresults{:, 2});
    end
    
    % plot first two components against each other
    figure; grid on; hold on;
    title([algname, ' trajectory plot (x_2 against x_1)']);
    
    % plot for each step size
    for stepresult = stepresults'
        plot(stepresult{3}(2, :), stepresult{3}(3, :));
    end
    
    % finish plot
    hold off;
    legend(stepresults{:, 2});
%    %print(['report/', func2str(algfunc), 'traj'], '-dpdf');
end

% solve ODE using RK4 with automatic step size
[result, sizes, errors] = RK4Automatic(sysfuncts, initvalues, interval, ...
    1e-5, 10e-10, 10e-10);

% plot trajectory
figure;
plot(result(2, :), result(3, :));
grid on;
title('RK4 auto-step trajectory plot (x_2 against x_1)');

% plot statistics
stats = {
    "RK4 auto-step step size", "rk4sizes", sizes;
    "RK4 auto-step approximation error", "rk4errors", errors
};
for stat = stats'
    figure;
    plot(result(1, 2:(end - 1)), stat{3});
    grid on;
    title(stat{1});
end

% compare results with ODE45
odefun = @(t, x) [ sysfuncts{1}(x); sysfuncts{2}(x) ];
odeoptions = odeset('RelTol', 10e-10, 'AbsTol', 10e-10);
[t, x] = ode45(odefun, interval, initvalues, odeoptions);
figure;
plot(x(:, 1), x(:, 2));
grid on;
title('ODE45 trajectory plot (x_2 against x_1)');
