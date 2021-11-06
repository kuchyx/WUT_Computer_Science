function x = iterativeResidualCorrection(Matrix, x, Vector)
    r = Matrix*x - Vector;
    euclideanColumnsormOfR = norm(r);
    new_euclideanColumnsormOfR = euclideanColumnsormOfR;    
    x = improveSolution(x, new_euclideanColumnsormOfR, euclideanColumnsormOfR, Matrix, Vector);
end % end function