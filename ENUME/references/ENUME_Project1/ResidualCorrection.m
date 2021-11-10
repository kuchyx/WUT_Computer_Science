function [TableOfErrors] = ResidualCorrection(n, subpoint)
    TableOfErrors = zeros(n, 1);
    TableOfErrorsAC = zeros(n, 1);
    TableOfErrorsAC2 = zeros(n, 1);
    TableOfNValues = zeros(n, 1);
    for i = 1:n
        TableOfNValues(i) = 10*2^(i-1);
        disp(i);
        x = TASK2(10*2^(i-1));
        if subpoint == 'A'
            x = TaskA(x);
        elseif subpoint == 'B'
            x = TaskB(x);
        end
        TableOfErrors(i) = norm(x.errors);
        x = ResidualCorrection(x);
        x= GetErrors(x);
        TableOfErrorsAC(i) = norm(x.errors);
        x = ResidualCorrection(x);
        x= GetErrors(x);
        TableOfErrorsAC2(i) = norm(x.errors);
    end
    plot(TableOfNValues, TableOfErrors, '-o');
    hold on;
    ylabel('Maximal absolute value of an error') 
    xlabel('N')
    plot(TableOfNValues, TableOfErrorsAC, '-or');
    plot(TableOfNValues, TableOfErrorsAC2, '-og');
    hold off;
end