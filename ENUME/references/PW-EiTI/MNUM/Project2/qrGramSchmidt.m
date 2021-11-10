function [Q, R] = qrGramSchmidt(A)
    % modificated Gram-Schmidt algorithm
    [height, width] = size(A);
    Q = zeros([height, width]);
    R = zeros([width, width]);
    D = zeros([1, width]);
    for i = 1:width
        Q(:,i) = A(:,i);
        R(i,i) = 1;
        D(:,i) = Q(:,i).' * Q(:,i);
        for j = i+1:width
            R(i,j) = Q(:,i).' * A(:,j) / D(:,i);
            A(:,j) = A(:,j) - R(i,j) * Q(:,i);
        end
    end
    % normalization
    for i = 1:width
        norm = calculateNorm(Q(:,i));
        Q(:,i) = Q(:,i)/norm;
        R(i,i:width) = R(i,i:width) * norm;
    end
end

