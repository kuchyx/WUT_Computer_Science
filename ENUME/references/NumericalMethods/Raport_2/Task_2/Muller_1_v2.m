function [root, iteration]  = Muller_1_v2 (x_0, x_1, x_2, iteration)
    
    iteration = iteration + 1;

    %--- Incremental variable z ---%
    z_0 = x_0 - x_2;
    z_1 = x_1 - x_2;
    
    
    A = zeros(2, 2);
    b = zeros(2, 1);

    %--- Create&solve system of linear equations, Ax = b ---%  
    %--- Where x consist of a and b parabola coefficients ---%
    A(1, 1) = z_0;
    A(1, 2) = z_0^2;
    A(2, 1) = z_1;
    A(2, 2) = z_1^2;

    b(1) = fnTask_2(x_0) - fnTask_2(x_2);
    b(2) = fnTask_2(x_1) - fnTask_2(x_2);
    
    %--- Quadratic Function Coefficients ---%
    a(1) = fnTask_2(x_2); %--- c
    a(2:3) = A\b; %--- b - second element, c - third element in vector a
    
    %--- Roots of parabola interpolation ---%
    z_root_1 = ( -2 * a(1) ) / ( a(2) + sqrt(a(2)^2 - 4 * a(1) * a(3)) );
    z_root_2 = ( -2 * a(1) ) / ( a(2) - sqrt(a(2)^2 - 4 * a(1) * a(3)) );
    
    if abs( z_root_1 ) <= abs( z_root_2 ) 
        z_min = z_root_1;
    else
        z_min = z_root_2; 
    end
    
    new_point = x_2 + z_min;
    
    if abs( fnTask_2(new_point) ) < 1e-10
        
        root = new_point;  
    elseif new_point >= x_0 && new_point < x_1
        
        [root, iteration] = Muller_1_v2 (x_0, new_point, x_1, iteration);
    elseif new_point >= x_1 && new_point < x_2
        
        [root, iteration] = Muller_1_v2 (x_1, new_point, x_2, iteration);
    elseif new_point < x_1 
        
        [root, iteration] = Muller_1_v2 (new_point, x_0, x_1, iteration);
    else
      
        [root, iteration] = Muller_1_v2 (x_1, x_2, new_point, iteration);
    end 
    
end