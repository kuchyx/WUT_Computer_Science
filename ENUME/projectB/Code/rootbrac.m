% finds the root brackets of a function within the given range
function brackets = rootBracketing(givenFunction, intervalLeft, intervalRight)
    % define search resolution
    resolution = (intervalRight - intervalLeft) / 10;
    
    % start search at the start of the range
    a = intervalLeft;
    b = intervalLeft + resolution;
    brackets = double.empty(2, 0);
    
    % keep moving the interval until the range is exceeded
    while 1
        % if the function changes sign inside the interval, a bracket has been found
        if sign(givenFunction(a)) ~= sign(givenFunction(b))
            % save bracket
            brackets(:, size(brackets, 2) + 1) = [a, b];
        end
        
        % if the bracket can't be expanded, return
        if b == intervalRight; return; end
        
        % check next bracket
        a = b;
        b = min(a + resolution, intervalRight);
    end
end
