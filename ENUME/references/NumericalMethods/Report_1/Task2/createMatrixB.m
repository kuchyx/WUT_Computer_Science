function a = createMatrixB(n)

    a = zeros(n,n);

    for i = 1 : n
        for j = 1 : n    
            a(i,j) = 8 / (9 * (i + j + 1));
        end
    end

end

