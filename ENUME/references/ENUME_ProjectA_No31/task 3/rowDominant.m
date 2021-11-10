function [out] = rowDominant(A)
%ROWDOMINANT checks row dominance of matrix A
%   returns true when dominant, false otherwise
n = size(A);

for i = 1:1:n
    sum = 0;
    for j = 1:1:n
        if i == j
            continue
        end
        sum = sum + abs(A(i,j));
    end
    if abs(A(i,i)) <= sum
        out = false;
        return
    end
end
out = true;
end

