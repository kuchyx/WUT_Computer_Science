%funkcja obliczajaca zera funkcji metoda siecznych
%Dane wejsciowe:	
%           l.r - lewa i prawa strona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba uteracji
%Dane wyjsciowe: zerospoint - wyznaczone miejsce zerowe
function szeropoint = secant(fun,l,r,iter)
  a = l;
  b = r;
  fa = feval(fun,a); %wartosc funkcji w punkcie start.
  for k = 1:iter
    fb = feval(fun,b);
    dx = fb * (b-a) / (fb-fa); %wyznaczenie przeciecia sieczna
    xm = b-dx; %zawezenie przedzialu
    if(isnan(xm))
        return
    end
    a = b;
    b = xm;
    fa = fb;
    szeropoint = b;
    fprintf('%3d	[%12.10f;%12.10f]   %12.16f     %12.3e\n',k,a,b,xm,fb);
    if(fb == 0) %dodatkowy warunek zakonczenia wykonywania
        return
    end
  end
end
