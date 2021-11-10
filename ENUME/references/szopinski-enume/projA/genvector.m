% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% https://github.com/Lachcim/szopinski-enume

% generates the b vector for task 2, sub-task a or b
function output = genvector(task, size)
    % initialize empty vector
    output = zeros(size, 1);
    
    if task == 'a'
        % formula for b_i given explicitly
        for i = 1:size
            output(i) = 4 + 0.3 * i;
        end
    else
        % 1/(3i) for even positions only
        for i = 2:2:size
            output(i) = 1 / (3 * i);
        end
    end
end
