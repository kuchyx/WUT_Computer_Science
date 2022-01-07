% ENUME MICHAŁ SZOPIŃSKI
% PROJECT C NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% coordinate arguments
argsx = -1:0.1:1;
argsy = -2:0.5:12;

% available functions
functs = {
    "x_1", -67, 50, @(x, y) y + x * (0.5 - x^2 - y^2);    
    "x_2", -115, 30, @(x, y) -x + y * (0.5 - x^2 - y^2)
};

% plot each function
for funct = 1:size(functs, 1)
    [functname, cama, camb, functh] = functs{funct, :};
    
    % evaluate values
    vals = zeros(length(argsx), length(argsy));
    for i = 1:size(argsx, 2)
        for j = 1:size(argsy, 2)
            vals(i, j) = functh(argsx(i), argsy(j));
        end
    end
    
    % plot
    figure;
    surf(argsx, argsy, vals');
    title(strcat("Gradient of ", functname));
    xlabel('x_1');
    ylabel('x_2');
    zlabel(strcat("d", functname, "/dt"));
    xlim([argsx(1), argsx(end)]);
    ylim([argsy(1), argsy(end)]);
    view(cama, camb);
    grid on;
    set(gcf, 'PaperPosition', [0 0 6 4]);
    set(gcf, 'PaperSize', [6 4]);
    print(strcat('report/', functname, 'gradient'), '-dpdf');
end
