function[sum] = sumDiag(L1,i)
    sum=0;
    for k = 1:1:i-1
       sum=sum+L1(i,k)^2;
    end
end