%Funkcja zwracajaca wektor pierwiastkow rzeczywistych wielomianu
%danego w zadaniu
%x - punkt startowy
%n - ilosc iteracji
function [z] = muller(x,n)
    %z = (1:n); 
    for i = 1:n
        %obliczamy mianowniki punktow w celu ich porownania
        z1 = df(x,1)+sqrt(df(x,1)^2-2*df(x,0)*df(x,2));
        z2 = df(x,1)-sqrt(df(x,1)^2-2*df(x,0)*df(x,2)); 
    
        if abs(z1) > abs(z2)
            zmin = -2*df(x,0)/z1; 
        else 
            zmin = -2*df(x,0)/z2;
        end 
        x = x+zmin; 
        fprintf('%d     %f      %f\n ',i,x,zmin);
    end
    z = x; 
end
