%funkcja wyznaczajaca zera funkcji metoda bisekcji
%Dane wejsciowe:	l,r - lewa i prawa sterona przedzialu poszukiwan
%			fun - funkcja 
%			iter - maksymalna liczba iteracji
%Dane wyjsciowe: zerospoint - wyznaczone miejsce zerowe
function bzeropoint = bisection(fun,l,r,iter)
  a = l; 
  b = r;
  fa =feval(fun,a);     %  Wartosci poczatkowe f(a) i f(b)
  fb =feval(fun,b);
  for k=1:iter
    xm = a + 0.5*(b-a);    %  Poprawne obliczenie srodka przedzialu
    fm = feval(fun,xm);      %  f(x) w srodku przedzialu
    fprintf('%3d    [%12.10f;%12.10f]	%12.16f     %12.3e\n',k,a,b,xm,fm);
    if(fm == 0)
        return
    end
    if sign(fm)==sign(fa)    %  Zero lezy w przedziale [xm,b], zamiana a
        a = xm;
        fa = fm;
    else                     %  Zero lezy w przedziale [a,xm], zamiana b
        b = xm;
        fb = fm;
    end
    if(fm == 0) %dodatkowy warunek zakonczenia wykonywania
        return
    end
  end
  bzeropoint = xm; 
  return
end
	

		
