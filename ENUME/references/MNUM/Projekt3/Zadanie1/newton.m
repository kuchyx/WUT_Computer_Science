%funkcja obliczajaca zera funkcji metoda Newtona
%Dane wejsciowe:	
%           l - prawa strona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba iteracji
%Dane wyjsciowe: zerospoint - wyznaczone miejsce zerowe
function nzeropoint = newton(fun,l,iter)
  x0 = l; 
  for k = 1:iter
    [fold, fpold] = feval(fun,x0); 
    dx = fold / fpold; %wyznaczenie przyrostu funkcji
    x0 = x0 - dx;
    fprintf('%3d	%12.10f     %12.16f     %12.3e \n',k,dx,x0,fold);
    if(fold == 0)
        return
    end
	if fold==0 %dodatkowy warunek zatrzumania
        nzeropoint = x0;
        break; 
    end
  end
end
  