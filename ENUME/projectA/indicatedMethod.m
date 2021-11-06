function x = indicatedMethod(Matrix, Vector)
    [~,Columns] = size(Matrix);
    checkIfMatrixIsSquareMatrix(Matrix);
    [Matrix, Vector] = gaussianEliminationWithPartialPivoting(Columns, Matrix, Vector);
    [Matrix, Vector, x] = backSubstitutionPhase(Columns, Matrix, Vector);
    x = iterativeResidualCorrection(Matrix, x, Vector);
end % end function