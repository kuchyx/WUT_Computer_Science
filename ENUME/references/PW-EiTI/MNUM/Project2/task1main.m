function [] = task1main()
    %SIZE 5 
    tolerance = 0.1;
    for i = 1:5
        sum = 0;
        for j = 1:30
            A = rand(5);
            [eigenvalues, iterations] = eigenvaluesWithShifts(A, tolerance, 1000000);
            sum = sum + iterations;
            if j == 30
                g=sprintf('%d ', eig(A));
                fprintf('\nExample results for size 5 matlab\n%s\n', g);
                g=sprintf('%d ', eigenvalues);
                fprintf('\nExample results for size 5 my\n%s\n', g);
            end
        end
        fprintf('\nMean iterations for tolerance %d\n', tolerance);
        fprintf('%d\n', sum/30);
        tolerance = tolerance / 10;
    end
    % SIZE 10
    tolerance = 0.1;
    for i = 1:5
        sum = 0;
        for j = 1:30
            A = rand(10);
            [eigenvalues, iterations] = eigenvaluesWithShifts(A, tolerance, 1000000);
            sum = sum + iterations;
            if j == 30
                g=sprintf('%d ', eig(A));
                fprintf('\nExample results for size 10 matlab\n%s\n', g);
                g=sprintf('%d ', eigenvalues);
                fprintf('\nExample results for size 10 my\n%s\n', g);
            end
        end
        fprintf('\nMean iterations for tolerance %d\n', tolerance);
        fprintf('%d\n', sum/30);
        tolerance = tolerance / 10;
    end
    % SIZE 20
    tolerance = 0.1;
    for i = 1:5
        sum = 0;
        for j = 1:30
            A = rand(20);
            [eigenvalues, iterations] = eigenvaluesWithShifts(A, tolerance, 1000000);
            sum = sum + iterations;
            if j == 30
                g=sprintf('%d ', eig(A));
                fprintf('\nExample results for size 20 matlab\n%s\n', g);
                g=sprintf('%d ', eigenvalues);
                fprintf('\nExample results for size 20 my\n%s\n', g);
            end
        end
        fprintf('\nMean iterations for tolerance %d\n', tolerance);
        fprintf('%d\n', sum/30);
        tolerance = tolerance / 10;
    end
end