%calculte from definition eigenvalues for 2x2 matrix
%return eigenvalues = x from equation det(A - xI) = 0
function [eigenvalues] = eigenvalues2x2Matrix(A)
    eigenvalues = zeros([2,1]);
    delta = (A(1,1) + A(2,2))^2 - 4*(A(1,1)*A(2,2) - A(1,2)*A(2,1));
    eigenvalues(1) =  (A(1,1)+A(2,2) - sqrt(delta))/2;
    eigenvalues(2) = (A(1,1) + A(2,2)) - eigenvalues(1); 
end