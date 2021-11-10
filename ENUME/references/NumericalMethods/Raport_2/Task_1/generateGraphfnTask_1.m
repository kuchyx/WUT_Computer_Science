function generateGraphfnTask_1(density)

    x = linspace(2, 11, density);

    y = zeros(1, density);
    y1 = zeros(1, density);

    for i = 1 : (density) 
        y(i) = fnTask_1(x(i)); 
    end

    figure 
    plot(x, y, x, y1);
    title ('fnTask1 Graph');
    xlabel ('2 < x < 11');
    ylabel ('y = fnTaks1(x)');

end