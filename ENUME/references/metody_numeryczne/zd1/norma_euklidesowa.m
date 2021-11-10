function [norm] = norma_euklidesowa(W,n)
    s = 0;
    for i = 1:n %wiersz
        s = s + (abs(W(i))).^2;
    end
    norm = sqrt(s);
end