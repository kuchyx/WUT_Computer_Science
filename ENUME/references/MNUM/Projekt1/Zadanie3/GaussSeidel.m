function[x,iter,od] = GaussSeidel(A,b,n,e) 
    x = zeros(n,1);
    
    %Stworzenie macierzy naddiagonalne, poddiagonalnej i diagonalnej
    [L,D,U] = rozkladGaussSeidel(A,n);
    b=b';
    r = 1;
    iter = 1;                                  
    while(r>e || norm(A*x-b)>e)                                   %kolejne iteracje
        y = x;                                  %zapamietujemy wektor x z poprzedniej iteracji
        w = U*x - b;
        for i = 1:n
            x(i) = (-L(i,:)*x- w(i))/D(i,i);
        end
    r = norm(x-y);                                %liczmy blad z nomrmy euklidesowej, po kazdej iteracji
    iter = iter + 1;                              %zliczamy ilosc iteracji
    
    end
    %fprintf('norm(A*x-b):%d\n',norm(A*x-b));
    od=norm(A*x-b);
end