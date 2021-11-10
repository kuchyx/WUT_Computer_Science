function [y] = f2(x1, x2)
    y = -x1 + x2*(0.5 - x1^2 - x2^2);
end