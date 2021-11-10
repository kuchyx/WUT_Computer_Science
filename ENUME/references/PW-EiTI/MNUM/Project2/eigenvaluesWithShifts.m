function [eigenvalues, allIterations] = eigenvaluesWithShifts(A, tol, maxIterations)
    height = size(A,1);
    eigenvalues = diag(zeros(height));
    initialSubmatrix = A;
    allIterations = 0;
    for k = height:-1:2
        DK = initialSubmatrix;
        iteration = 0;
        while iteration<=maxIterations && max(abs(DK(k,1:k-1))) > tol
            DD = DK(k-1:k,k-1:k);
            EV = eigenvalues2x2Matrix(DD);
            shift = EV(2);
            if abs(EV(1) - DD(2,2)) < abs(EV(2) - DD(2,2))
                shift = EV(1);
            end
            DK = DK - eye(k) * shift;
            [Q, R] = qrGramSchmidt(DK);
            DK = R * Q + eye(k) * shift;
            iteration = iteration + 1;
            allIterations = allIterations + 1;
        end
        if iteration > maxIterations
            error('More iterations needed');
        end
        eigenvalues(k) = DK(k,k);
        if k > 2
            initialSubmatrix = DK(1:k-1,1:k-1);
        else
            eigenvalues(1) = DK(1,1);
        end
    end
end