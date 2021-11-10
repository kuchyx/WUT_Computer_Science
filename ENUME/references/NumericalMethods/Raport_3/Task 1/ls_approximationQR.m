function [a, residuum] = ls_approximationQR(n, x, y)
    % n - polynomial order
    % x - x samples coordinate vector 
    % y - f(x) values vector

    % F(x) = a_0*x^0 + a_1*x^1 + a_2*x^2 + ... + a_n*x^n

    [~, m] = size(x); % m - number of samples

    % Gram's Matrix(set of normal equations)
    A = zeros(m, n+1);

    for i = 1:m
        for j = 1:(n+1)
           A(i,j) = x(1, i)^(j-1);
        end
    end

    % R*a = QT*y
    [Q, R] = mgs(A);
    a = R \ (Q' * y'); 
    residuum = norm((R * a) - (Q' * y'));
    a = flipud(a);
    

end