function [wartWlasne, iteracje, time, ok] = bezPrzesun(D, tolerance, imax)
    %imax - maksymalna liczba iteracji
    % ok - czy funkcja wykonala sie z przekroczeniem imax
    start = tic;
    ok = 1; 
    i = 1; 
    
    while i <= imax && max(max(D-diag(diag(D)))) > tolerance
        [Q1, R1] = qrZmodGS(D);
        D = R1*Q1; %macierz po przekszta³ceniu
        i = i + 1;
    end
    
    if i > imax 
        ok = 0;
    end
    iteracje = i;
    wartWlasne = diag(D); %wykstraktowanie wektora wartoœci w³asnych
    time = toc(start);
end