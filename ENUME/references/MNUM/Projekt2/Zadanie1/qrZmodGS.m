%rozk³ad QR (waski) macierzy zmodyfikowanym alg. Grama-Schmidta dla 
%macierzy mxn (m>=n) o pelnym rzedzie, rzeczywistej lub zespolonej 
%na podstawie ksi¹zki prof. Tatjewskiego
function [Q,R] = qrZmodGS(A)
    [m n] = size(A);
    Q = zeros(m,n); 
    R = zeros(n,n);
    d = zeros(1,n);
    %rozk³ad A z kolumnami Q ortogonalnymi
    for i=1:n
        R(i,i)=1;
        Q(:,i)=A(:,i);
        d(i)=Q(:,i)'*Q(:,i);
        for j=i+1:n
            R(i,j)=(Q(:,i)'*A(:,j))/d(i);
            A(:,j)=A(:,j)-R(i,j)*Q(:,i);
        end
    end
    %normowanie rozkladu (kolumny Q ortogonalne)
    for i=1:n
        dd = norm(Q(:,i));
        Q(:,i) = Q(:,i)/dd;
        R(i,i:n) = R(i,i:n)*dd;
    end
end