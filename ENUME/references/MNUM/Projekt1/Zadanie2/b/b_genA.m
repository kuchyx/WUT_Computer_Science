function [A] = b_genA(n)
    v1 = 4*n^2-1:-1:4*n^2-n;
    A = diag(v1);
        for i = 1:n-1
            j=i+1;
            while(j <= n)
                A(i,j) = 2*(i+j)+1; %dodanie wartoœci do odpowiedniego indeksu macierzy
                j=j+1;
            end
        end
    A = triu(A)+triu(A,1)'; %odbicie symetrzyczne wobec przek¹tnej
end