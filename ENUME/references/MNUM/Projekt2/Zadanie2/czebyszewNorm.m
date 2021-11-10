function [maxError] = czebyszewNorm(a,f,x)
    p = polyval(a,x);
    [s,~] = size(f);
    i = 1;
    maxError = 0;
    while i<=s
        err = abs(p(i)-f(i));
        if err > maxError 
            maxError = err;
        end
        i = i + 1;
    end
end