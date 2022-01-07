% solves system with triangular matrix
function result = backSubstitution(eqsys)
    for col = size(eqsys, 1):-1:1
        % normalize diagonal coefficients to 1
        eqsys(col, :) = eqsys(col, :) / eqsys(col, col);
        
        % eliminate factor from other rows
        for row = (col - 1):-1:1
            reductor = eqsys(row, col) / eqsys(col, col);
            eqsys(row, :) = eqsys(row, :) - eqsys(col, :) * reductor;
        end
    end
    
    % rightmost column is now the result
    result = eqsys(:, size(eqsys, 2));
end
