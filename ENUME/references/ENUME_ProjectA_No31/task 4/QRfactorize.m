function [Q,R] = QRfactorize(A)
%QRFACTORIZE factorizes the matrix A using QR factorization
%   returns the matrices Q and R
[m, n] = size(A);
Q = zeros(m, n);
R = zeros(m, n);
d = zeros(m, n);
%Factorization
for i = 1:1:n
    Q(:, i) = A(:, i);
    R(i, i) = 1;
    d(i) = Q(:, i)' * Q(:, i);
    
    for j = i+1:1:n
        R(i, j) = (Q(: ,i)' * A(:, j)) / d(i);
        A(:, j) = A(:, j) - R(i, j) * Q(:, i);
    end
end
%Normalization
for i = 1:1:n
    dd = norm(Q(:, i));
    Q(:, i) = Q(:, i) / dd;
    R(i, i:n) = R(i, i:n) * dd;
end
end

