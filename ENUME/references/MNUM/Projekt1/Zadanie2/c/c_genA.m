function [A] = c_genA(n)
    v1 = 0.2*n+0.3:0.3:0.2*n+0.3*n;
    A = diag(v1);
        for i = 1:n-1
            j=i+1;
            while(j <= n)
                A(i,j) = 1/(4*(i+j+1)); %dodanie wartoœci do odpowiedniego indeksu macierzy
                j=j+1;
            end
        end
    A = triu(A)+triu(A,1)'; %odbicie symetryczne wobec przek¹tnej
end