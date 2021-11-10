%DF funkcja zwracajaca wyznaczona analitycznie pochodna wielomianu
%danego w zadaniu. 
%x - argument
%n  - 0-wartosac funkcji,1-pierwsza pochodna,2-druga pochodna
% f(x) = x^4+3x^3-8x^2+4x+2
% f'(x) = 4x^3+9x^2-16x+4
% f''(x) = 12x^2+18x-16
function [value] = df(x,n)
    if n == 0
        value = x.^4+3*x.^3-8*x.^2+4*x+2; 
    elseif n == 1
        value = 4*x.^3+9*x.^2-16*x+4;
    elseif n == 2
        value = 12*x.^2+18*x-16;
    else
        value = 0; 
    end
end

