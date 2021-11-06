function checkIfMatrixIsSquareMatrix(Matrix)
[Rows,Columns] = size(Matrix);
if Rows ~= Columns
    error ('Matrix is not square matrix!');
end % end if