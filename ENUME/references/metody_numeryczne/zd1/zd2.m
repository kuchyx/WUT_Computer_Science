function [X, U, b] = zd2(A, b, n)
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
    
    Y = linsolve(A,b);
    
    L = eye(n);
    U = A;

    for k = 1:n-1
    %odnalezienie max
        max = intmin;
        P = eye(n);
        j = k; %kolumna
        for i = j:n %wiersz
            if U(i,j) > max
                max = U(i,j);
                ik = i;
            end
        end
        %end odnalezienie max
        
        %macierz P
        Ptemp = P;
        Ptemp(k,:) = P(ik,:);
        P(ik,:) = P(k,:);
        P(k,:) = Ptemp(k,:);
        %end macierz P

        %zamiana wierszy
        b = P * b;
        U = P * U;
        L = P * L * P;
        %end zamiana wierszy

        %macierz L, nowa macierz U i wektor b
        for i = k+1:n
            L(i,k) = U(i,k) / U(k,k);
            U(i,:) = U(i,:) - L(i,k) * U(k,:);
            b(i) = b(i) - L(i,k) * b(k);
        end;
        %end macierz L, nowa macierz U i wektor b  
    end

    [X] = oblicz(U, b, n);
    %%%
    czy_rowne(X, Y);
end


