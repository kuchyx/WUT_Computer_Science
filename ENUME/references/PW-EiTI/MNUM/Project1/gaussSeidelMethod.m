function [x] = gaussSeidelMethod(A, b)
  iters = 10000;
  size = length(A);
  x = zeros([size 1]);
  for k = 1:iters
    for i = 1:size
      sum = 0;
      for j = 1:size 
        if j != i
          sum = sum + A(i,j)*x(j);
        end
      end
      x(i) = (b(i) - sum)/A(i,i);
    end
  end
end