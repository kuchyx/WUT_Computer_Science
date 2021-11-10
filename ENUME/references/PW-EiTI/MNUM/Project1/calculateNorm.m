function [err] = calculateNorm(vector)
%norm 2 of vector
  sum = 0;
  for i = 1:size(vector)
    sum = sum + vector(i,1)^2;
  end
  err = sqrt(sum);
end