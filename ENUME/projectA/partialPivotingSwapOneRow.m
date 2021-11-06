function [Matrix, Vector] = partialPivotingSwapOneRow(Matrix, Vector, i1, i3, m)
    if Matrix(i3,i1) == m
    swapRowMatrix(Matrix, i1, i3);
    swapValueVector(Vector, i1, i3);
    end % end if
end % end function