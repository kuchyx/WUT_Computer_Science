function generateGraphfnTask_2(density)

    x = linspace(-40, 40, density);

    y = zeros(1, density);
    
    y0 = zeros(1, density);
    
    y1 = zeros(1, density);

    for i = 1 : (density) 
        y(i) = fnTask_2(x(i)); 
    end
    
    a = v_mm1;
    
    for i = 1 : (density)
        y1(i) = a(1) + a(2) * x(i) + a(3) * x(i)^2; 
    end

    figure 
    plot(x, y, x, y0);%, x, y1);
    title ('fnTask2 Graph');
    xlabel ('-40 < x < 40');
    ylabel ('y = fnTaks2(x)');

end