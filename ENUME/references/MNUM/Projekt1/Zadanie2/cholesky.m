function[L1] = cholesky(A,n)    
    L1 = zeros(n,n);
    for i = 1:n                                                 %przechodzenie po kolumnach
        for j = i:n                                             %przechodzenie wierszy wewn¹trz kolumny
            if(i == j)
                L1(i,i) = sqrt(A(i,i)-sumDiag(L1,i));           %przypisanie wartoœci na przek¹tnej macierzy
            else
                L1(j,i) = (A(j,i)-sumRest(L1,i,j))/L1(i,i);     %przypisanie wartoœci w reszcie przypadków
            end
        end
    end
end