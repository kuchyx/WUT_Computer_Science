function a = createMatrixA(n)

    a = zeros(n,n);

    for i = 1 : n
        for j = 1 : n    
            if i == j 
                a(i,j) = 9;
            elseif (i == j - 1) || (i == j + 1)
                a(i,j) = 3;
            else 
                a(i,j) = 0;
            end
        end
    end

end
