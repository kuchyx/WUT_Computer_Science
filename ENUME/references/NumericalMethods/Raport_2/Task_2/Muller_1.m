clear; 
clc;

%--- Initial guesses ---%
x = [-1, -0.7, -0.5];

%--- Find value of function at given points ---%
fn_x = zeros(1, 3);

for i = 1 : 3
	fn_x(i) = fnTask_2(x(i));
end

%--- New incremental variable z ---%
z = zeros(1, 3);

iteration = 0; 

while abs(fn_x(2)) >= 1e-10 && ~isinf(fn_x(2)) && ~isnan(fn_x(2))
    
    for i = 1 : 3
        fn_x(i) = fnTask_2(x(i));
    end
    
    
    iteration = iteration + 1;     

    for i = 1 : 2
        z(i) = x(i) - x(3); 
    end

    %--- y(z) = az^2 + bz + c ---%
    %--- a * z(1)^2 + b * z(1) = fn_x(1) - fn_x(3) ---%
    %--- a * z(2)^2 + b * z(2) = fn_x(2) - fn_x(3) ---%

    %--- Interpolation of parabola defined in the variable z ---%
    A = zeros(2, 2);
    b = zeros(2, 1);

    A(1, 1) = z(1)^2;
    A(1, 2) = z(1);
    A(2, 1) = z(2)^2;
    A(2, 2) = z(2);

    b(1) = fn_x(1) - fn_x(3);
    b(2) = fn_x(2) - fn_x(3);

    answer = A\b;

    a = zeros(1, 3);

    %--- Quadratic Function Coefficient ---%
    a(1) = fn_x(3); %--- c 
    a(2) = answer(2); %--- b
    a(3) = answer(1); %--- a

    %--- Draw the parabola interpolation ---%
    %--- and value of polynomial for initial guesses ---%
    %--- assigned to incremental variable z ---%
    %     x_1 = linspace(-4, 4, 100);
    %     y_1 = zeros(1, 100);
    % 
    %     for i = 1 : 100 
    %         y_1(i) = a(1) + a(2) * x_1(i) + a(3) * x_1(i)^2;
    %     end
    % 
    %     y_2 = zeros(1, 100);
    % 
    %     plot(z, fn_x, 'o', x_1, y_1, x_1, y_2);

    %--- Find roots of parabola interpolation ---%
    root_1 = ( -2 * a(1) ) / ( a(2) + sqrt(a(2)^2 - 4 * a(1) * a(3)) );
    root_2 = ( -2 * a(1) ) / ( a(2) - sqrt(a(2)^2 - 4 * a(1) * a(3)) );

    %--- Choose variable for next iteration ---% 
    if ( abs( a(2) + sqrt( a(2)^2 - 4 * a(1) * a(3) ) ) >= abs( a(2) - sqrt( a(2)^2 - 4 * a(1) * a(3) ) ) )
        z_min = root_1;
    else
        z_min = root_2; 
    end

    new_point = x(3) + z_min;
    
    
    if x(2) <= new_point
    
        x(1) = x(2);
        fn_x(1) = fn_x(2);
        
        if x(3) > new_point   
            x(2) = new_point;
            fn_x(2) = fnTask_2(x(2));
        else
            x(2) = x(3);
            fn_x(2) = fn_x(3);
            x(3) = new_point;
            fn_x(3) = fnTask_2(x(3));
        end
    else
    
        x(3) = x(2);
        fn_x(3) = fn_x(2);
        if x(1) < new_point   
            x(2) = new_point;
            fn_x(2) = fnTask_2(x(2));
        else
            x(2) = x(1);
            fn_x(2) = fn_x(1);
            x(1) = new_point;
            fn_x(1) = fnTask_2(x(1));
        end
    end

end

    
