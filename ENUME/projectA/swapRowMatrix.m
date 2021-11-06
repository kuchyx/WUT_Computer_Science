function Matrix = swapRowMatrix(Matrix, i1, i3) 
    tempRow =  Matrix(i1 , :);
    Matrix(i1 , :) = Matrix(i3, :);
    Matrix(i3, :) = tempRow;
end