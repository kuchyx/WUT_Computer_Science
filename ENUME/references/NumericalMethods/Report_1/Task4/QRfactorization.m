%Function performs QR factorization on matrix A.
%N indicates the size of matrix A.
function [Q, R] = QRfactorization(A, N)

Q = zeros(N, N);
R = zeros(N, N);
d = zeros(1, N);

for i = 1:N
   
   Q(:, i) = A(:, i);
   R(i, i) = 1;
   d(i) = Q(:, i)' * Q(:, i);
   
   for j = i+1:N
        R(i, j) = (Q(:, i)' * A(:, j)) / d(i);
        A(:, j) = A(:, j) - R(i, j) * Q(:,i);
   end
end

    for i = 1:N
        dd = norm(Q(:,i));
        Q(:, i) = Q(:, i) / dd;
        R(i, i:N) = R(i, i:N) * dd;
    end

end