% ENUME MICHAŁ SZOPIŃSKI
% PROJECT B NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% finds the root brackets of a function within the given range
function brackets = rootbrac(func, rangestart, rangeend)
    % define search resolution
    resolution = (rangeend - rangestart) / 10;
    
    % start search at the start of the range
    a = rangestart;
    b = rangestart + resolution;
    brackets = double.empty(2, 0);
    
    % keep moving the interval until the range is exceeded
    while 1
        % if the function changes sign inside the interval, a bracket has been found
        if sign(func(a)) ~= sign(func(b))
            % save bracket
            brackets(:, size(brackets, 2) + 1) = [a, b];
        end
        
        % if the bracket can't be expanded, return
        if b == rangeend; return; end
        
        % check next bracket
        a = b;
        b = min(a + resolution, rangeend);
    end
end
