function [Q, R, invqtq] = QRDecomposition(A)
    % initialize empty matrices
    Q = zeros(size(A));
    R = eye(size(A, 2));
    invqtq = zeros(size(A, 2));
    
    % modified Gram-Schmidt, use each column to orthogonalize the ones in front of it
    for col = 1:size(A, 2)
        % by the time we've reached this column, it's already been orthogonalized
        Q(:, col) = A(:, col);
        
        % calculate current column dot product for R
        coldot = dot(Q(:, col), Q(:, col));
        invqtq(col, col) = 1 / coldot;
        
        % orthogonalize further columns
        for next = (col + 1):size(A, 2)
            % calculate R cell for this column pair
            R(col, next) = dot(Q(:, col), A(:, next)) / coldot;
            
            % orthogonalize column
            A(:, next) = A(:, next) - R(col, next) * Q(:, col);
        end
    end
   
end
