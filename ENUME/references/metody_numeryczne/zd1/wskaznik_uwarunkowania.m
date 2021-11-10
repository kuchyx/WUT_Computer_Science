function [cond] = wskaznik_uwarunkowania(A, n)
    B = A^-1;
    max1 = intmin;
    max2 = intmin;
    s1 = 0;
    s2 = 0;
    for i = 1:n %wiersz
        for j = 1:n
            if abs(A(i,j)) > max1
                max1 = abs(A(i,j));
            end
            if abs(B(i,j)) > max2
                max2 = abs(B(i,j));
            end
        end
        s1 = s1 + max1;
        s2 = s2 + max2;
        max1 = intmin;
        max2 = intmin;
    end
    cond = s1 * s2;
end