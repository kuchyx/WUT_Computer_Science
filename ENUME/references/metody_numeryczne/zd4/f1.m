function [y] = f1(x1, x2)
    y = x2 + x1*(0.5 - x1^2 - x2^2);
end