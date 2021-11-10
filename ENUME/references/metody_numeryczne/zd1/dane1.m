function [A,b,n] = dane1(n)
    %n = 10;
    A = zeros(n);
    b = zeros(n,1);
    %dane 1
    for j = 1:n %kolumna
        for i = 1:n %wiersz
            if i == j-1 || i == j+1
                A(i,j) = 3;
            end       
        end
        A(j,j) = 7;
        b(j) = 2.5 + 0.5*i;
    end
end