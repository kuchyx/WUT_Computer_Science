function [x] = forwardSubstitution(A,b)
    m = length(b);                                      %wy³uskanie ostatniego indeksu
    x(1,1) = b(1)/A(1,1);                               %wyliczenie pierwszego elementu
    for i = 2:m                                         %iteracja po wszystkich równaniach pocz¹wszy od drugiego wiersza
        x(i,1)=(b(i)-A(i,1:i-1)*x(1:i-1,1))./A(i,i);    %wyznaczanie niewiadomych
    end
end