function [x, errors] = GaussSeidelMethod(A, b)
%GAUSSSEIDELMETHOD solves a system Ax = b using the Gauss-Seidel iterative method
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

n = length(A);
iteration = 1;
errors(iteration) = vecnorm(A*x - b);

while errors(iteration) > 10^-10
    w = U*x - b;
    for i = 1:1:n
        sum = 0;
        for j = 1:1:i-1
            sum = sum - L(i,j) * x(j);
        end
        sum = sum - w(i);
        x(i) = sum / D(i,i);
    end
    
    iteration = iteration + 1;
    
    errors(iteration) = vecnorm(A*x - b);
end

