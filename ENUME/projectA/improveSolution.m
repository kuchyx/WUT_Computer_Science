function x = improveSolution(x, new_euclideanColumnsormOfR, euclideanColumnsormOfR, Matrix, Vector)
    while new_euclideanColumnsormOfR <= euclideanColumnsormOfR
        euclideanColumnsormOfR = new_euclideanColumnsormOfR;
        r = Matrix*x - Vector;
        x = x - r;
        new_euclideanColumnsormOfR = norm(r);
    end % end while
end % end function