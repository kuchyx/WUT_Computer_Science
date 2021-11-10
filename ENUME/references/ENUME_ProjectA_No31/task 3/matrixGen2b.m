function [A,b] = matrixGen2b(n)
%matrixGen2b Generates matrices for the task 2b
%   generates matrices for a system Ax = B of n linear equations

A = zeros(n, n);
b = zeros(n, 1);

for i = 1:n
   if( mod(i,2) == 0 )
       b(i) = 2/(3*i);
   else
       b(i) = 0;
   end
   for j = 1:n
       A(i,j) = 7/(8*(i+j+1));
   end 
end
end