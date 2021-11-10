function b = createVectorB(n)

    b = zeros(n,1);
    
    for i = 1 : n
        if (mod(i,2) == 0 )
            b(i, 1) = 4/(3*i); 
        else 
            b(i, 1) = 0;
        end
    end

end


