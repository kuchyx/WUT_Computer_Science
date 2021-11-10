% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% TASK 3
% https://github.com/Lachcim/szopinski-enume

% define matrix A and vector b as specified in the task
taskA = [18,   2, -3,   1;
          2, -25,  5, -18;
          1,   3, 13,  -8;
          1,   1, -2, -10];
taskb = [7, 12, 24, 20]';

% define available algorithms
algorithms = {
    'Jacobi', @jacobi;
    'Gauss-Seidel', @gaussseidel
};

% perform task for all available algorithms
for alg = 1:size(algorithms, 1)
    [algname, algfunc] = algorithms{alg, :};
    
    % find solution and step errors using the given algorithm
    [solution, errors] = algfunc(taskA, taskb);
    disp(['Solution using ', algname, ':']);
    disp(solution);
    disp(['Error: ', num2str(errors(size(errors, 2)))]);
    
    % plot error data
    figure;
    semilogy(1:size(errors, 2), errors, '-o');
    title(['LE solution error (', algname, ' algorithm)']);
    xlabel('Step');
    ylabel('Error');
    grid on;
    set(gcf, 'PaperPosition', [0 0 6 4]);
    set(gcf, 'PaperSize', [6 4]);
    print(['report/', func2str(algfunc), 'error'], '-dpdf')
end

% solve task 2a using the GS algorithm
taskA = genmatrix('a', 10);
taskb = genvector('a', 10);

[solution, errors] = gaussseidel(taskA, taskb);
disp('Solution to task 2a using Gauss-Seidel:');
disp(solution);
disp(['Error: ', num2str(errors(size(errors, 2)))]);

% solves LE system using the Jacobi algorithm, returns error per step
function [x, errors] = jacobi(A, b)
    % split input matrix and create step zero result vector
    [lower, upper, invdiagonal] = splitmatrix(A);
    x = ones(size(A, 1), 1);
    
    % get Jacobi iterative M and w
    M = -invdiagonal * (lower + upper);
    w = invdiagonal * b;
    
    % execute the algorithm until the desired accuracy is achieved
    errors = double.empty(1, 0);
    while 1
        % calculate next iteration
        x = M * x + w;
        
        % calculate error and stop when it's low enough
        error = norm(A * x - b);
        errors(size(errors, 2) + 1) = error;
        if error < 1e-10; break; end
    end
end

% solves LE system using the Gauss-Seidel algorithm
function [x, errors] = gaussseidel(A, b)
    % split input matrix and create step zero result vector
    [lower, upper, invdiagonal] = splitmatrix(A);
    x = ones(size(A, 1), 1);
    
    % execute the algorithm until the desired accuracy is achieved
    errors = double.empty(1, 0);
    while 1
        % calculate step-specific iterative w
        w = upper * x - b;
        
        % calculate next iteration, row by row
        for row = 1:size(x)
            % reset value, subtract step-specific w
            x(row) = -w(row);
            
            % subtract elements of the lower matrix multiplied by previous results
            for col = 1:(row - 1)
                x(row) = x(row) - lower(row, col) * x(col);
            end
            
            % divide by the diagonal
            x(row) = x(row) * invdiagonal(row, row);
        end
    
        % calculate error and stop when it's low enough
        error = norm(A * x - b);
        errors(size(errors, 2) + 1) = error;
        if error < 1e-10; break; end
    end
end

% splits a matrix a into lower, upper and inverse diagonal matrices
function [lower, upper, invdiagonal] = splitmatrix(input)
    % allocate empty matrices
    lower = zeros(size(input));
    upper = zeros(size(input));
    invdiagonal = zeros(size(input));
    
    % copy each element to the right output matrix
    for i = 1:size(input, 1)
        for j = 1:size(input, 2)
            if i > j; lower(i, j) = input(i, j);
            elseif i < j; upper(i, j) = input(i, j);
            else; invdiagonal(i, j) = 1 / input(i, j);
            end
        end
    end
end
