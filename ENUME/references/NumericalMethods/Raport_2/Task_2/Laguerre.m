function [root, iteration] = Laguerre(initial_guess, iteration)
   
    iteration = iteration + 1;

    %--- Quadratic Function Coefficients ---%
    a(1) = fnTask_2(initial_guess); %--- c
    a(2) = dfnTask_2(initial_guess); %--- b, dfn - first order derivative
    a(3) = ( ddfnTask_2(initial_guess) ) / 2; %--- a, ddfn - second order derivative
    
    denominator_1 = ( a(2) + sqrt( 3 * ( 3 * a(2)^2 - 2 * a(1) * a(3) ) ) );
    denominator_2 = ( a(2) - sqrt( 3 * ( 3 * a(2)^2 - 2 * a(1) * a(3) ) ) );
    
    if abs( denominator_1 ) > abs( denominator_2 )
        initial_guess = initial_guess - ( 4 * a(1) ) / ( a(2) + sqrt( 3 * ( 3 * a(2)^2 - 2 * a(1) * a(3) ) ) );
    else
        initial_guess = initial_guess - ( 4 * a(1) ) / ( a(2) - sqrt( 3 * ( 3 * a(2)^2 - 2 * a(1) * a(3) ) ) );
    end
    
    if (fnTask_2(initial_guess) >= 1e-10)
        [root, iteration] = Laguerre(initial_guess, iteration);
    else
        root = initial_guess; 
    end
end