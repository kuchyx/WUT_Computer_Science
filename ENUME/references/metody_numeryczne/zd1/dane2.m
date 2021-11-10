function [A,b,n] = dane2(n)
    %n = 10;
    A = zeros(n);
    b = zeros(n,1);
    %dane 1
    for j = 1:n %kolumna
        for i = 1:n %wiersz
            if i ~= j
                A(i,j) = 2*(i-j)+2;
            end
        end
        b(j) = 2 + 0.4*i;
        A(j,j) = 1/6;
    end
end