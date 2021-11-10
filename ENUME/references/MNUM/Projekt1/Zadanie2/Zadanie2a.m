function [] = Zadanie2a(n)
    A = a_genA(n);          %generator macierzy wejœciowej A
    b = a_genB(n);          %generator macierzy wejœciowej b
    b=b';
    
    tic                     %rozpoczêcie pomiaru czasu
    L1 = cholesky(A,n);     %rozk³ad metod¹ Cholesky'ego-Banachiewicza
    x = solveEq(L1,b);      %rozwi¹zanie równania
    t = toc;                %koniec pomiaru czasu
    
    r = b - A * x;          %obliczenie residuum
    br = norm(r);           %obliczenie b³êdu rozwi¹zania jako normy z residuum
    
    fprintf("Zmierzony czas rozwi¹zania: %d \n",t);
    fprintf("Liczba równañ i b³¹d rozwi¹zania: \n %d %d \n",n,br);
end