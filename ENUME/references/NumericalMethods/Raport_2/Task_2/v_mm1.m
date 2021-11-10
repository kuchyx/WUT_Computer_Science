function a = v_mm1()
    x = [7 , 7.25, 7.5];

    g = zeros(3, 3);
    q = zeros(3, 1);


    %--- Second order polynomial approximation ---%
    %--- Find Gram's Matrix ---%
    for i = 1 : 3

        for j = 1 : 3 
       
            for n = 1 : 3
                g(i, j) = g(i, j) + x(n)^(i + j - 2);
            end
        
        end
    
    end

    %--- Find funny greek letter ---% 
    for i = 1 : 3 
    
        for n = 1 : 3
            q(i, 1) = q(i,1) + fnTask_2(x(n)) * x(n)^(i-1);
        end
    
    end

    a = g\q;

    delta = a(2)^2 - 4 * a(3) * a(1);
    sqrt_delta = sqrt(delta);

    x_0 = (-a(2) + sqrt_delta) / 2 * a(3);
    x_1 = (-a(2) - sqrt_delta) / 2 * a(3);

end

