function [eigenvalues, iteration] = eigenvaluesWithoutShifts(A, tol, maxIterations)
    iteration = 0;
    while iteration < maxIterations && max(max(A-diag(diag(A)))) > tol
        [Q, R] = qrGramSchmidt(A);
        A = R * Q;
        iteration = iteration + 1;
    end
    if iteration > maxIterations
        error('More iterations needed');
    end
    eigenvalues = diag(A);
end