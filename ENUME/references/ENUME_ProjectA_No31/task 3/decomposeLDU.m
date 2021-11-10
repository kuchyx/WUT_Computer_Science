function [L,D,U] = decomposeLDU(A)
%DECOMPOSELDU decomposes the matrix A into L+D+U
%   returns L - lowerdiagonal, D - diagonal, U - upperdiagonal

n = size(A);
L = zeros(n);
D = zeros(n);
U = zeros(n);

for i = 2:1:n
    for j = 1:1:i-1
        L(i,j) = A(i,j);
    end
end

for i = 1:1:n
    D(i,i) = A(i,i);
end

for i = 1:1:n
    for j = i+1:1:n
        U(i,j) = A(i,j);
    end
end

end

