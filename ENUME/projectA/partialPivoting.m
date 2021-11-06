function [Matrix, Vector] = partialPivoting(Matrix, Vector, i1, m)
    [~,Columns] = size(Matrix);
    for i3 = i1 : Columns
        partialPivotingSwapOneRow(Matrix, Vector, i1, i3, m);
    end % end for
end % end function