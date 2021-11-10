function [A,b,n] = dane3(n)
    A = zeros(n);
    b = zeros(n,1);
    %dane 1
    for j = 1:n %kolumna
        for i = 1:n %wiersz
            if mod(i, 2) == 0
                b(i) = 7/(6*i);           
            end
            A(i,j) = 1/(4*(i+j+1));
        end
    end
end