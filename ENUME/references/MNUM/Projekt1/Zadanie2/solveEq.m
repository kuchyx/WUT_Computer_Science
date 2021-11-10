function [x] = solveEq(L1,b)
    b = b';                             %transponowanie macierzy
    y = forwardSubstitution(L1,b);      
    x = backwardSubstitution(L1',y);
end