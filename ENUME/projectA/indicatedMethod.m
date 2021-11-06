function x = indicatedMethod(Matrix, Vector) % Name of the method as in the textbook
% x stands for obtained result
    checkIfMatrixIsSquareMatrix(Matrix);
    [Matrix, Vector, x] = solveSystem(Matrix, Vector);
    norm(x)
    x = iterativeResidualCorrection(Matrix, x, Vector); % Improve on the solution
    norm(x)
end % end function

function [Matrix, Vector, x] = solveSystem(Matrix, Vector)
    [~,Columns] = size(Matrix); % We need to know how big the matrix is in next steps
    % notice the '~', since we assume we use square matrix, we do not need
    % to have another variable for number of rows since it is the same as
    % number of columns
    [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector); 
    % Change matrix to upper triangular matrix
    [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector); 
    % Get the solution
end % end function

function checkIfMatrixIsSquareMatrix(Matrix)
    [Rows,Columns] = size(Matrix);
    if Rows ~= Columns
        error ('Matrix is not square matrix!');
    end % end if
end % end function

function [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector)
    for j = 1 : Columns
            centralElement = max(Matrix(j:Columns,j)); 
            % we stay in the same row (j) but we change columns, as in the
            % textbook
            [Matrix, Vector] = partialPivoting(Matrix, Vector, j, centralElement, Columns);
            % ensures that a_kk != 0 and reduces errors
            [Matrix, Vector] = gaussianElimination(j, Columns, Matrix, Vector);
            % change matrix into upper triangular matrix
    end % end for
end % end function

function [Matrix, Vector] = partialPivoting(Matrix, Vector, j, centralElement, Columns)
    for k = j : Columns
        partialPivotingSwapOneRow(Matrix, Vector, j, k, centralElement);
    end % end for
end % end function

function [Matrix, Vector] = partialPivotingSwapOneRow(Matrix, Vector, j, k, centralElement)
    if Matrix(k,j) == centralElement
    swapRowMatrix(Matrix, j, k); % swap jth row with kth row
    swapValueVector(Vector, j, k); % swap jth value with kth value
    end % end if
end % end function

function Matrix = swapRowMatrix(Matrix, j, k) 
    temp =  Matrix(j , :); % ' : ' denote "all elements in jth row"
    Matrix(j , :) = Matrix(k, :);
    Matrix(k, :) = temp; % temp equal to previous value of jth row
end

function Vector = swapValueVector(Vector, j, k) 
    temp = Vector(j);
    Vector(j) = Vector(k);
    Vector(k) = temp;  % temp equal to previous value of k element of vector
end % end function

function [Matrix, Vector] = gaussianElimination(j, Columns, Matrix, Vector)        
    for i = j + 1 : Columns       
        rowMultiplier = Matrix(i,j) / Matrix(j,j);
        [Matrix, Vector] = substractRows(Matrix, Vector, i, rowMultiplier, j, Columns);            
    end % end for
end % end function

function [Matrix, Vector] = substractRows(Matrix, Vector, i, rowMultiplier, j, Columns)
    Vector(i) = Vector(i) - rowMultiplier * Vector(j);
    for curentColumn = 1 : Columns
        Matrix(i,curentColumn) = Matrix(i,curentColumn) - rowMultiplier * Matrix(j, curentColumn);
    end % end for
end % end function

function [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector)
    for k = Columns : -1 : 1 
    % Start at final column and move by -1 each iteration until we reach 1
        equation = 0;
        for j = k+1 : Columns
            equation = equation + Matrix(k,j) * x(j, 1); 
            % even though x is a vector we still need to put '1' to ensure
            % that number of columns in the first matrix matches number of
            % rows in second matrix
        end % end for
      
        x(k, 1) = (Vector(k,1) - equation) / Matrix(k,k);
        % even though x is a vector we still need to put '1' to ensure
        % that we do not exceed array bounds
    end % end for
end % end function

function x = iterativeResidualCorrection(A, x, b)
    r = A*x - b;
    euclideanNormOfR = norm(r);
    new_euclideanNormOfR = euclideanNormOfR;    
    while new_euclideanNormOfR <= euclideanNormOfR
           euclideanNormOfR = new_euclideanNormOfR;
           r = A*x - b;
           x = x - r;
           new_euclideanNormOfR = norm(r);
    end
end % end function
