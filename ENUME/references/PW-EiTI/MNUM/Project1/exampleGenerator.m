function [A, b] = exampleGenerator(matrixSize, exampleNumber)
  if exampleNumber == 1
    A = zeros(matrixSize, matrixSize);
    for i = 1:matrixSize
      for j = 1:matrixSize
        if i==j
          A(i,j) = 9.0;
        elseif i==j-1 || i==j+1
          A(i,j) = 3.0;
        else
          A(i,j) = 0.0;
        end  
      end
    end
    b = zeros(matrixSize, 1);
    for i = 1:matrixSize
      b(i, 1) = 3.4 + 0.6 * i;
    end
  elseif exampleNumber == 2
    A = zeros(matrixSize, matrixSize);
    for i = 1:matrixSize
      for j = 1:matrixSize
        if i==j
          A(i,j) = 1/3;
        else
          A(i,j) = 5*(i-j)+2;
        end  
      end
    end
    b = zeros(matrixSize, 1);
    for i = 1:matrixSize
      b(i,1) = 8+0.2*i;
    end 
  elseif exampleNumber == 3  
    A = zeros(matrixSize, matrixSize);
    for i = 1:matrixSize
      for j = 1:matrixSize
        A(i,j) = 1/[4*(i+j+1)];
      end
    end
    b = zeros(matrixSize, 1);
    for i = 1:matrixSize
      b(i,1) = 2+2/(i+1);
    end
  end 
end