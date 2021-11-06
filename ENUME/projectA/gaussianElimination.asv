function x = gaussianElimination(A, b) % A - matrix, b - vector
    [~, Height] = size(A);
    % Find column with greatest value element 
    for i = 1 : Height - 1
        m = max(A(i:Height, i)); 
        % Find row with greatest value element 
        for k = i : Height
            if A(k, i) == m % If the element has the biggest value we now 
                % have the value of two rows that we want to swap
               % Swap row in matrix A %
                swapRow(A, i, k);
                swapValue(b, i, k);
              break;
            end % end if
        end % end for
           % Swap value in vector B %
       
    end % end for

    for j = i + 1 : Height
        l = A(j, i) / A(i, i);
        b(j, 1) = b(j, 1) - l * b(i, 1);

        for t = 1 : Height
            A(j, t) = A(j, t) - l * A(i, t);
        end % end for 
    end % end for



x = zeros(Height, 1);



for k = Height: -1:1
    E = 0;
    for iter = k + 1  : Height
        E = E + A(k, iter) * x(iter, 1);
    end

    x(k, 1) = (b(k, 1) - E) / A(k, k);
end


end % end function




function swapRow(A, j, k)
    temp = A(j, :);
    A(j, :) = A(k, :);
    A(k, :) = temp;
end % end function

function swapValue(b, j, k)
    temp = b(j);
    b(j) = b(k);
    b(k) = temp;
end % end function

