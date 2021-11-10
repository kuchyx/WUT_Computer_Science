function [x, errors] = JacobiMethod(A, b)
%JACOBIMETHOD solves a system Ax = b using the Jacobi iterative method
%   The accuracy target is 10e-10
%   returns x - the solution and errors - vector of errors for each
%   iteration

[L, D, U] = decomposeLDU(A);

%Checking covergence conditions
if ~(rowDominant(A) || columnDominant(A))
    sr = max(abs(eig(-inv(D)*(L+U))));
    if sr >= 1
        x = sr;
        return
    end
end

%Initial guess
x = zeros(length(A), 1);

Di = inv(D);
iteration = 1;
errors(iteration) = vecnorm(A*x - b);

while errors(iteration) > 10^-10
    x = -Di * (L+U) * x + Di*b;
    
    iteration = iteration + 1;
    
    errors(iteration) = vecnorm(A*x - b);
end

