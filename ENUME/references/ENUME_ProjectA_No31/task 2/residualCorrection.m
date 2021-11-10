function [Rnew,Xnew] = residualCorrection(r,x,AT,b,A)
%RESIDUALCORRECTION calculates an iteration of residual correction
%   currently not working properly
n = length(x);
dx = zeros(n, 1);
for o = 1:n
    k = n-o+1;
    sum = 0;
    for j = k+1:n
        sum = sum + (AT(k,j) * dx(j));
    end
    dx(k) = (r(k) - sum)/AT(k,k);
end
Xnew = x - dx;
Rnew = A*Xnew - b;
end

