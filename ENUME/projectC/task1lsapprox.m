function task1()
    for polydeg = 0:3
        dataPoints = functionDataPoints();
        % obtain factors of approximating polynomial
        [factors, error, gramcond] = approximate(dataPoints, polydeg);
        
        % print error and condition number
        disp(['Approximation degree ', num2str(polydeg), ':']);
        disp(['Error: ', num2str(error)]);
        disp(['Condition number: ', num2str(gramcond)]);
        
        % plot data points
        figure;
        grid on;
        hold on;
        title(['Polynomial approximation of the function (degree ', ...
            num2str(polydeg), ')']);
        scatter(dataPoints(:, 1), dataPoints(:, 2));
        
        % plot approximation
        x = dataPoints(1):0.05:dataPoints(end, 1);
        y = evalapprox(factors, x);
        plot(x, y);
        
        % finish and print graph
        hold off;
        set(gcf, 'PaperPosition', [0 0 6 4]);
        set(gcf, 'PaperSize', [6 4]);
        %print(['report/approx', num2str(polydeg)], '-dpdf');
    end
end



% find the approximating polynomial of the given degree
function [factors, error, gramcond] = approximate(dataPoints, polydeg)
    % define the A matrix used for solving the error minimization problem
    A = zeros(size(dataPoints, 1), polydeg + 1);
    
    % calculate cells of A using natural basis
    for row = 1:size(A, 1)
        for col = 1:size(A, 2)            
            A(row, col) = dataPoints(row, 1) ^ (col - 1);
        end
    end
    
    % solve least-square problem using QRdash decomposition
    [Q, eqsys, invqtq] = QRDecomposition(A);
    eqsys(:, end + 1) = invqtq * Q' * dataPoints(:, 2);
    factors = backSubstitution(eqsys);
    
    % calculate error and condition number of Gram's matrix
    error = norm(dataPoints(:, 2) - A * factors);
    gramcond = cond(A' * A);
end

% evaluate the value of an approximation at the given x
function y = evalapprox(factors, xarray)
    y = zeros(1, size(xarray, 2));
    
    for xi = 1:size(xarray, 2)
        for i = 1:size(factors, 1)
            y(xi) = y(xi) + factors(i) * xarray(xi) ^ (i - 1);
        end
    end
end
