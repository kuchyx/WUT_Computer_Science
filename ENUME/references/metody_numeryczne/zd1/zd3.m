function [X] = zd3(A, b, n)    
    if det(A) == 0 
        warning('Macierz osobliwa. Nie da siê wykonaæ zadania');
        return;
    end;
    %wsk =  wskaznik_uwarunkowania(A, n);
    if cond(A) > 1e6
        %disp(wsk);
        warning('Macierz Ÿle uwarunkowana');
        return;
    end;
    
    A1 = A;
    b1 = b;
    
    L = zeros(n);
    U = zeros(n);
    D = zeros(n);
    N = zeros(n);
    X = zeros(n,1);

    for j = 1:n %kolumna
        for i = 1:n %wiersz
            if i > j
                L(i,j) = A(i,j);
            elseif i < j
                U(i,j) = A(i,j);
            end
        end
        D(j,j) = A(j,j);
        N(j,j) = 1/D(j,j);
    end
    
    
    M = -N*(L+U);
    
    %warunki zbierznosci
    s = 0;
    for i = 1:n
        for j = 1:n
            if i ~= j
                s = s + abs(A(i,j));
            end
        end
        if s > abs(A(i,i))
            if 1 < max(abs(eig(M))) 
                error('ci¹g nie jest zbie¿ny');
            end;
        end
        s = 0;
    end
    %end warunki zbierznosci
    
    k = 1;
    while k ~= 1000
        k = k + 1;
        Xpop = X;
        X = M * X + N * b;
        if norma_1(X - Xpop,n) <= 1e-6 
            if norma_euklidesowa(A*X-b,n) <= 1e-6
                break;
            end
            k = 1;
        end;
    end;
    Y = linsolve(A1,b1); %do sprawdzenia
    czy_rowne(X, Y);