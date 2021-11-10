function [A, b] = matrixGen2a(n)
%matrixGen2a Generates matrices for the task 2a
%   generates matrices for a system Ax = B of n linear equations

A = zeros(n, n);
b = zeros(n, 1);

for i = 1:n
    b(i) = 0.9*i;
   for j = 1:n
       if(i == j)
           A(i, j) = 11;
       elseif (i == j-1)
           A(i, j) = 5;
       elseif (i == j+1)
           A(i, j) = 5;
       end
   end
end
end

