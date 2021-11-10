function [eps] = calculateEps()
  %finding smallest eps where eps + 1 > 1 
  x = 1.0;
  while (x + 1 > 1)
    eps = x;
    x = x/2;
  end
end
