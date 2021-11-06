function [Matrix, Vector] = gaussianElimination(i1, Columns, Matrix, Vector)        
    for i2 = i1 + 1 : Columns
                    
        l = Matrix(i2,i1) / Matrix(i1,i1);
        [Matrix, Vector] = substractRows(Matrix, Vector, i2, l, i1, Columns);            
    
    end % end for
end % end function