% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% TASK 2
% https://github.com/Lachcim/szopinski-enume

% define maximum feasible equation count (10 * 2^n)
maxeqcount = 5;

% perform calculation for both sub-tasks
for task = 'ab'
    % collect error values for different equation counts
    errors = zeros(maxeqcount + 1, 2);
    
    % perform calculation for increasing number of equations
    for equationspow = 0:maxeqcount
        equationcount = 10 * 2 ^ equationspow;
        
        % generate coefficient matrix A and vector b
        A = genmatrix(task, equationcount);
        b = genvector(task, equationcount);
        eqsys = [A, b];
        
        % perform gaussian elimination and back-substitution
        [eqsys, lower, upper, permut] = gausseli(eqsys);
        result = backsubst(eqsys);
        
        % note the error
        errorvector = A * result - b;
        error = norm(errorvector);
        errors(equationspow + 1, :) = [equationcount, error];
        
        % additional calculations for 10 equations
        if equationspow == 0
            % print solution
            disp(['Solution to subtask ', task ', 10 equations:']);
            disp([(1:10)', result, errorvector]);
            disp(['Error: ', num2str(error)]);
            
            % residual correction: calculate deltax and correct result
            for i = 1:10
                % solve system using LU decomposition
                intermediate = backsubstflip([lower, permut * errorvector]);
                deltax = backsubst([upper, intermediate]);
                
                % apply correction to result
                result = result - deltax;
                errorvector = A * result - b;
            end
            
            % print corrected result
            disp('With residual correction:');
            disp([(1:10)', result, errorvector]);
            disp(['Error: ', num2str(norm(errorvector))]);
        end
    end
    
    % plot error data
    figure;
    plot(errors(:, 1), errors(:, 2), '-o');
    title(['Linear equation system solution error (subtask ', task, ')']);
    xlabel('Equation count');
    ylabel('Error');
    grid on;
    set(gcf, 'PaperPosition', [0 0 6 4]);
    set(gcf, 'PaperSize', [6 4]);
    print(['report/', task, 'error'], '-dpdf')
end

% performs Gaussian elimination and LU decomposition
function [eqsys, lower, upper, permut] = gausseli(eqsys)
    % initialize lower triangular and permutation matrix
    lower = zeros(size(eqsys, 1));
    permut = eye(size(eqsys, 1));
    
    % for every column, eliminate (size - column) coefficients
    for col = 1:size(eqsys, 1)
        % partial pivoting - find best row
        bestrow = 0;
        bestscore = 0;
        for row = col:size(eqsys, 1)
            score = abs(eqsys(row, col));
            if score > bestscore
                bestrow = row;
                bestscore = score;
            end
        end
        
        % swap first row and best row
        eqsys([col, bestrow], :) = eqsys([bestrow, col], :);
        permut([col, bestrow], :) = permut([bestrow, col], :);
        
        for row = (col + 1):size(eqsys, 1)
            % calculate reductor constant and perform reduction
            reductor = eqsys(row, col) / eqsys(col, col);
            eqsys(row, :) = eqsys(row, :) - eqsys(col, :) * reductor;
            
            % add reductor to lower matrix
            lower(row, col) = reductor;
            
            % simulate perfect reduction
            eqsys(row, col) = 0;
        end
        
        % permute the lower matrix
        lower([col, bestrow], :) = lower([bestrow, col], :);
        lowertmp = lower(col, col);
        lower(col, col) = lower(bestrow, col);
        lower(bestrow, col) = lowertmp;
    end
    
    % return lower and upper triangular matrices
    lower = lower + eye(size(lower));
    upper = eqsys(:, 1:size(eqsys, 2) - 1);
end

% performs back-substitution for lower triangular matrices
function result = backsubstflip(eqsys)
    % flip the equation system for lower triangular matrices
    eqcount = size(eqsys, 1);
    eqsys(:, 1:eqcount) = rot90(eqsys(:, 1:eqcount), 2);
    eqsys(:, eqcount + 1) = flipud(eqsys(:, eqcount + 1));
    
    % perform back-substitution and flip the result
    result = flipud(backsubst(eqsys));
end
