function [err] = euklidesNorm(a,f,x)
    p = polyval(a,x);
    [s,~] = size(f);
    i = 1;
    sum=0;
    while i<=s
        sum = sum + (p(i)-f(i))^2;
        i = i + 1;
    end
    err = sqrt((1/s)*sum);
end