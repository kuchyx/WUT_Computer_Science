% ENUME MICHAŁ SZOPIŃSKI
% PROJECT B NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% graph the real roots of a function
function printroots(func, algorithms, interval, brackets, plottitle, outputsuffix)
    % perform task for all available algorithms
    for alg = 1:size(algorithms, 1)
        [algname, algfunc] = algorithms{alg, :};
        
        % plot function inside interval
        figure;
        grid on;
        hold on;
        title([plottitle, ' (', algname, ')']);
        set(gca, 'XAxisLocation', 'origin');
        x = interval(1):0.05:interval(2);
        y = arrayfun(func, x);
        plot(x, y);
        
        % iterate over root brackets
        for bracket = brackets    
            % find all zeros within the bracket using the given algorithm
            [zero, steps] = algfunc(func, bracket(1), bracket(2), 1e-15);
            
            % plot steps on graph
            xline(bracket(1), 'color', [0.5, 0.5, 0.5]);
            xline(bracket(2), 'color', [0.5, 0.5, 0.5]);
            scatter(steps(1, 2:end), steps(2, 2:end), [], [0.929, 0.694, 0.125]);
            scatter(steps(1, 1), steps(2, 1), [], [0.635, 0.078, 0.184]);
            text(steps(1, 1), steps(2, 1), 'start', ...
                'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'top');
                
        % print root table
        disp([plottitle, ' (', algname, ')']);
        columns = {'step', 'root', 'value at root'};
        disp(table([1:size(steps, 2)]', steps(1, :)', steps(2, :)', 'VariableNames', columns));
        end
        
        % finish and print graph
        hold off;
        set(gcf, 'PaperPosition', [0 0 6 4]);
        set(gcf, 'PaperSize', [6 4]);
        print(['report/', func2str(algfunc), outputsuffix], '-dpdf');
    end
end
