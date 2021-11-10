%funkcja zwracajaca wartosc i pochodna z zadania 1
function [y,dy] = fun (x)
y = 1.4*sin(x)-exp(x)+6*(x)-0.5; 
dy = 1.4*cos(x)-exp(x) +6; 
end
