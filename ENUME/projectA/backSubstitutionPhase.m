function [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector)
    for i3 = Columns : -1 : 1
         
        E = 0;
        for iter = i3+1 : Columns
            E = E + Matrix(i3,iter) * x(iter,1);
        end % end for
      
        x(i3, 1) = (Vector(i3,1) - E) / Matrix(i3,i3);
    end % end for
end % end function