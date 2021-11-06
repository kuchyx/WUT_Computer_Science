function [Matrix, Vector] = substractRows(Matrix, Vector, i2, l, i1, Columns)
    Vector(i2,1) = Vector(i2,1) - l * Vector(i1, 1);
    for t = 1 : Columns
        Matrix(i2,t) = Matrix(i2,t) - l * Matrix(i1, t);
    end % end for
end % end function