function [X, AB] = gaussianElimination(M1, V1)
  AB = horzcat(M1, V1);
  [height, width] = size(AB);
  X = zeros([height 1]);
  for i = 1:height-1
    for j = i+1:height
      ratio = AB(j, i) / AB(i,i);
      for k = i:width
        AB(j,k) = AB(j,k) - ratio * AB(i,k);
      end 
    end
  end
  for i = height:-1:1
    s = AB(i,width);
    for j = height:-1:i+1
      s = s- AB(i,j) * X(j); 
    end
    X(i) = s / AB(i,i);
  end
end  