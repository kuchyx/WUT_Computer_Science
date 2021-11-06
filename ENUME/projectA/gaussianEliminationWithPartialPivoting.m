function [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector)
    for i1 = 1 : Columns - 1   
            m = max(Matrix(i1:Columns,i1));
            partialPivoting(Matrix, Vector, i1, m);
            [Matrix, Vector] = gaussianElimination(i1, Columns, Matrix, Vector);
    end % end for
end % end function