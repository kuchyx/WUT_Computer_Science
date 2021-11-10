function [root, iteration] = Muller_2(initial_guess, iteration)
    
    iteration = iteration + 1;

    %--- Quadratic Function Coefficients ---%
    a(1) = fnTask_2(initial_guess); %--- c
    a(2) = dfnTask_2(initial_guess); %--- b, dfn - first order derivative
    a(3) = ( ddfnTask_2(initial_guess) ) / 2; %--- a, ddfn - second order derivative
    
    %--- Roots of parabola interpolation ---%
    z_root_1 = ( -2 * a(1) ) / ( a(2) + sqrt( a(2)^2 - 2 * a(1) * a(3) ) ); 
    z_root_2 = ( -2 * a(1) ) / ( a(2) + sqrt( a(2)^2 + 2 * a(1) * a(3) ) ); 
    
    if abs(z_root_1) < abs(z_root_2)
        z_min = z_root_1;
    else
        z_min = z_root_2;
    end
    
    if (fnTask_2(initial_guess + z_min) >= 1e-10 )
        [root, iteration] = Muller_2(initial_guess + z_min, iteration);
    else
        root = initial_guess + z_min; 
    end

end