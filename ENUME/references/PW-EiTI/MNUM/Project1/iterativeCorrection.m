function [X] = iterativeCorrection(AB, X)
  matrixSize = size(AB);
  height = matrixSize(1);
  width = matrixSize(2);
  oldX = X;
  %spliting data on A and b
  A = AB([1:height],[1:height]);
  b = AB([1:height],[width:width]);
  residuum = A*X - b;
  newResiduum = residuum;
  for iteration = 1:30
    AB = horzcat(A,newResiduum);
    dX = zeros([height 1]);
    for i = height:-1:1
      s = AB(i,width);
      for j = height:-1:i+1
        s = s - AB(i,j) * dX(j); 
      end
      dX(i) = s / AB(i,i);
    end
    X = X - dX;
    newResiduum = A*X - b;
  end
  %check if iterative correction had result, if it didnt return old X
  if calculateNorm(residuum) > calculateNorm(newResiduum)
    fprintf('Result is better after correction\n');
  else
    fprintf('Result wasnt better after correction\n');  
    X = oldX;
  end
end
