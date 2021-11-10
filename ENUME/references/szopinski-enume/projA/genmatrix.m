% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% https://github.com/Lachcim/szopinski-enume

% generates coefficient matrix for task 2, sub-task a or b
function output = genmatrix(task, size)
    % initialize empty matrix
    output = zeros(size);
    
    if task == 'a'
        % 4's for the diagonal, 1's around it
        for i = 1:size
            output(i, i) = 4;
            if i ~= 1; output(i - 1, i) = 1; end
            if i ~= size; output(i + 1, i) = 1; end
        end
    else
        % formula for a_ij given explicitly
        for i = 1:size
            for j = 1:size
                output(i, j) = 6 / (7 * (i + j + 1));
            end
        end
    end
end
