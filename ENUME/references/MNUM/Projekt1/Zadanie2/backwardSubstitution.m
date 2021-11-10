function [x] = backwardSubstitution(A,b)
    m = length(b);                                      %wy³uskanie ostatniego indeksu
    x(m,1) = b(m)/A(m,m);                               %wyliczenie ostatniego elementu
    for i = m-1:-1:1                                    %iteracja po wszystkiech równaniach pocz¹wszy od przedostatniego wiersza
        x(i,1)=(b(i)-A(i,i+1:m)*x(i+1:m,1))./A(i,i);    %wyznaczenie niewiadomych
    end
end