function [out] = columnDominant(A)
%COLUMNDOMINANT checks column dominance of matrix A
%   returns true when dominant, false otherwise
n = size(A);

for j = 1:1:n
    sum = 0;
    for i = 1:1:n
        if i == j
            continue
        end
        sum = sum + abs(A(i,j));
    end
    if abs(A(j,j)) <= sum
        out = false;
        return
    end
end
out = true;
end