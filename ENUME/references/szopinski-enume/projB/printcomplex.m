% ENUME MICHAŁ SZOPIŃSKI
% PROJECT B NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% graph the complex roots of a function
function printcomplex(func, algorithms, bracket, plottitle, outputsuffix)
    % perform task for all available algorithms
    for alg = 1:size(algorithms, 1)
        [algname, algfunc] = algorithms{alg, :};
        
        % prepare plot
        figure;
        grid on;
        hold on;
        title([plottitle, ' (', algname, ')']);
        xlabel("Real part");
        ylabel("Imaginary part");
        set(gca, 'XAxisLocation', 'origin');
        
        % find all zeros within the bracket using the given algorithm
        [zero, steps] = algfunc(func, bracket(1), bracket(2), 1e-15);
        
        % plot steps on graph
        plot(real(steps(1, :)), imag(steps(1, :)), '-o');
        text(real(steps(1, 1)), imag(steps(1, 1)), 'start', ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'top');
        text(real(steps(1, end)), imag(steps(1, end)), 'end', ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'top');
        
        % finish and print graph
        hold off;
        set(gcf, 'PaperPosition', [0 0 6 4]);
        set(gcf, 'PaperSize', [6 4]);
        print(['report/', func2str(algfunc), outputsuffix], '-dpdf');
        
        % print root table
        disp([plottitle, ' (', algname, ')']);
        columns = {'step', 'root', 'abs value at root'};
        disp(table([1:size(steps, 2)]', steps(1, :)', abs(steps(2, :))', 'VariableNames', columns));
    end
end
