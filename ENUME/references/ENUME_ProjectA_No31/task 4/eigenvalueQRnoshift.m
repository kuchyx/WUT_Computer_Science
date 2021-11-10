function [eigenvalues,iteration,Afinal] = eigenvalueQRnoshift(A)
%EIGENVALUEQRNOSHIFT calculates eigenvalues using the QR method with no
%shifts
%   returns eigenvalues, the number of iterations and the transformed
%   matrix A
iteration = 1;
while max(max(A-diag(diag(A)))) > 10^-6
    [Q, R] = QRfactorize(A);
    A = R * Q;
    iteration = iteration+1;
end

eigenvalues = diag(A);
Afinal = A;

end

