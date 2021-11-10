function [norm] = norma_1(W, n)
    s = 0;
    for i = 1:n %wiersz
        s = s + abs(W(i));
    end
    norm = s;  
end