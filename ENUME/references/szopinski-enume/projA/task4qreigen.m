% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% TASK 4
% https://github.com/Lachcim/szopinski-enume

% define matrix of choice
A = [1, 1, 7, 5, 2;
     1, 8, 5, 4, 4;
     7, 5, 0, 8, 8;
     5, 4, 8, 0, 8;
     2, 4, 8, 8, 1];

% define available algorithms
algorithms = {
    'without shifts', @eigennoshifts;
    'with shifts', @eigenshifts
};

% solve problem using both algorithms
for alg = 1:size(algorithms, 1)
    [algname, algfunc] = algorithms{alg, :};
    
    % find solution and iteration count using the given algorithm
    [solution, iterations, finalMatrix] = algfunc(A);
    disp(['Solution using QR ', algname, ':']);
    disp(solution);
    disp('Final matrix:');
    disp(finalMatrix);
    disp(['Iteration count: ', num2str(iterations)]);
end

% finds the eigenvalues of a matrix using the QR method without shifts
function [eigenvalues, iterations, A] = eigennoshifts(A)
    % initialize iteration counter
    iterations = 0;
    
    while 1
        % converge to eigenvalue diagonal matrix
        [Q, R] = qrdecomp(A);
        A = R * Q;
        iterations = iterations + 1;
        
        % iterate until all non-diagonal elements are below the threshold
        nondiag = A - diag(diag(A));
        maxnonzero = max(max(abs(nondiag)));
        if (maxnonzero <= 1e-6); break; end
    end
    
    % convert eigenvalue matrix to vector
    eigenvalues = diag(A)';
end

% finds the eigenvalues of a matrix using QR with shifts
function [eigenvalues, iterations, finalMatrix] = eigenshifts(A)
    % initialize empty output
    eigenvalues = double.empty(1, 0);
    iterations = 0;
    
    % consider increasingly smaller sub-matrices
    matsize = size(A, 1);
    while matsize >= 2
        % find one eigenvalue
        while 1
            % find eigenvalue of the lower right corner
            corner = A((matsize - 1):matsize, (matsize - 1):matsize);
            cornereigen = eigenoftwo(corner);
            
            % shift and iterate algorithm
            A = A - eye(matsize) * cornereigen;
            [Q, R] = qrdecomp(A);
            A = R * Q + eye(matsize) * cornereigen;
            iterations = iterations + 1;
            
            % move on once the row has been zeroed out
            maxnonzero = max(abs(A(matsize, 1:(matsize - 1))));
            if (maxnonzero <= 1e-6)
                % remember discovered eigenvalue
                eigenvalues(size(eigenvalues, 2) + 1) = A(matsize, matsize);
                break;
            end
        end
        
        % deflate matrix
        finalMatrix(1:matsize, 1:matsize) = A;
        matsize = matsize - 1;
        A = A(1:matsize, 1:matsize);
    end
    
    % include final eigenvalue
    eigenvalues(size(eigenvalues, 2) + 1) = A(1, 1);
end

% finds the eigenvalue of a 2x2 matrix that is closer to the lower right corner
function eigen = eigenoftwo(A)
    % solve characteristic equation of matrix to find its eigenvalues
    delta = (A(1) + A(4)) ^ 2 - 4 * (A(1) * A(4) - A(2) * A(3));
    sqrtdelta = sqrt(delta);
    eigen1 = ((A(1) + A(4)) - sqrtdelta) / 2;
    eigen2 = ((A(1) + A(4)) + sqrtdelta) / 2;
    
    % return value closer to lower right corner
    if abs(A(4) - eigen1) < abs(A(4) - eigen2)
        eigen = eigen1;
    else
        eigen = eigen2;
    end
end
