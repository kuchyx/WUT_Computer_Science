function [x, A, b] = solveIndicated(A, b)
%SOLVEINDICATED solves system of linear equations Ax=b
%   uses the indicated method (Gaussain elimination with partial pivoting)
%   returns x - the solution and A,b - the system after transformation

sa = size(A);
sb = size(b);
if( sa(1) ~= sa(2) )
    return;
elseif ( sa(1) ~= sb(1) )
    return;
end

n = sa(1);

for k = 1:n
%   Partial pivoting
    i = k;
    for j = k+1:n
        if ( abs(A(j, k)) > abs(A(i, k)) )
            i = j;
        end
    end
    if( k~=i )
        A([k i], :) = A([i k], :);
        b([k i]) = b([i k]);
    end
%   Gauss transform
    for j = k+1:n
        l = A(j,k) / A(k,k);
        A(j, :) = A(j, :) - A(k, :) * l;
        b(j) = b(j) - b(k) * l;
    end
end
%Backwards substitution
x = zeros(n, 1);
for o = 1:n
    k = n-o+1;
    sum = 0;
    for j = k+1:n
        sum = sum + (A(k,j) * x(j));
    end
    x(k) = (b(k) - sum)/A(k,k);
end
end

