function [A] = a_genA(n)
    v1 = ones(1,n)*10;
    v2 = ones(1,n-1)*4;
    A = diag(v1) + diag(v2,1) + diag(v2,-1);
end