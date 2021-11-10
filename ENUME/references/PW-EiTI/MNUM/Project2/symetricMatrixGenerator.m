function [A] = symetricMatrixGenerator(size)
    A = rand(size);
    A = 0.5*(A+A.');
    for i = 1:size
        A(i,i) = rand;
    end
end