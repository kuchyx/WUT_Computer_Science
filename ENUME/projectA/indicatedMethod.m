function x = indicatedMethod(Matrix, Vector)
    [~,Columns] = size(Matrix);
    checkIfMatrixIsSquareMatrix(Matrix);
    [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector);
    [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector);
    x = iterativeResidualCorrection(Matrix, x, Vector);
end % end function

function checkIfMatrixIsSquareMatrix(Matrix)
    [Rows,Columns] = size(Matrix);
    if Rows ~= Columns
        error ('Matrix is not square matrix!');
    end % end if
end % end function

function [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector)
    for i1 = 1 : Columns - 1   
            m = max(Matrix(i1:Columns,i1));
            partialPivoting(Matrix, Vector, i1, m);
            [Matrix, Vector] = gaussianElimination(i1, Columns, Matrix, Vector);
    end % end for
end % end function

function [Matrix, Vector] = partialPivoting(Matrix, Vector, i1, m)
    [~,Columns] = size(Matrix);
    for i3 = i1 : Columns
        partialPivotingSwapOneRow(Matrix, Vector, i1, i3, m);
    end % end for
end % end function

function [Matrix, Vector] = partialPivotingSwapOneRow(Matrix, Vector, i1, i3, m)
    if Matrix(i3,i1) == m
    swapRowMatrix(Matrix, i1, i3);
    swapValueVector(Vector, i1, i3);
    end % end if
end % end function

function Matrix = swapRowMatrix(Matrix, i1, i3) 
    tempRow =  Matrix(i1 , :);
    Matrix(i1 , :) = Matrix(i3, :);
    Matrix(i3, :) = tempRow;
end

function Vector = swapValueVector(Vector, i1, i3) 
    tempVal = Vector(i1);
    Vector(i1) = Vector(i3);
    Vector(i3) = tempVal;
end % end function

function [Matrix, Vector] = gaussianElimination(i1, Columns, Matrix, Vector)        
    for i2 = i1 + 1 : Columns
                    
        l = Matrix(i2,i1) / Matrix(i1,i1);
        [Matrix, Vector] = substractRows(Matrix, Vector, i2, l, i1, Columns);            
    
    end % end for
end % end function

function [Matrix, Vector] = substractRows(Matrix, Vector, i2, l, i1, Columns)
    Vector(i2,1) = Vector(i2,1) - l * Vector(i1, 1);
    for t = 1 : Columns
        Matrix(i2,t) = Matrix(i2,t) - l * Matrix(i1, t);
    end % end for
end % end function

function [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector)
    for i3 = Columns : -1 : 1
         
        E = 0;
        for iter = i3+1 : Columns
            E = E + Matrix(i3,iter) * x(iter,1);
        end % end for
      
        x(i3, 1) = (Vector(i3,1) - E) / Matrix(i3,i3);
    end % end for
end % end function

function x = iterativeResidualCorrection(Matrix, x, Vector)
    r = Matrix*x - Vector;
    euclideanColumnsormOfR = norm(r);
    new_euclideanColumnsormOfR = euclideanColumnsormOfR;    
    x = improveSolution(x, new_euclideanColumnsormOfR, euclideanColumnsormOfR, Matrix, Vector);
end % end function

function x = improveSolution(x, new_euclideanColumnsormOfR, euclideanColumnsormOfR, Matrix, Vector)
    while new_euclideanColumnsormOfR <= euclideanColumnsormOfR
        euclideanColumnsormOfR = new_euclideanColumnsormOfR;
        r = Matrix*x - Vector;
        x = x - r;
        new_euclideanColumnsormOfR = norm(r);
    end % end while
end % end function