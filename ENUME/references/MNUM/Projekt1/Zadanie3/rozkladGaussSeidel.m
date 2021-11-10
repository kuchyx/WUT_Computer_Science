function[L,D,U] = rozkladGaussSeidel(A,n)
    L = zeros(n,n); %macierz poddiagonalna
    U = zeros(n,n); %macierz naddiagonalna
    D = diag(diag(A)); %macierz diagonalna
    
    for i = 1:n
        for j = 1:n
            if(i<j)
                U(i,j) = A(i,j);
            elseif(i>j)
                L(i,j) = A(i,j);
            end
        end
    end
end