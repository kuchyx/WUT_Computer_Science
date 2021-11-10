function [r] = euclideanNorm(rMatrix)
%EUCLIDEANNORM calculates Euclidean Norm
%   yes
sr = size(rMatrix);
if( size(sr) > 2 )
    return;
end
if( sr(1) == 1 )
    n = sr(2);
elseif( sr(2) == 1 );
    n = sr(1);
else
    return;
end
sum = 0;
for i = 1:n
    sum = sum + rMatrix(i)*rMatrix(i);
end
r = sqrt(sum);
end

