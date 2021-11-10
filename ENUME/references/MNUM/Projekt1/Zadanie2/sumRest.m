function[sum] = sumRest(L1,i,j)
    sum=0;
    for k = 1:1:i-1
        sum=sum+(L1(j,k)*L1(i,k));
    end
end