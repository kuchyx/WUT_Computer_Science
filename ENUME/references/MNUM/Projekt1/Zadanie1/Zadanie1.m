function [] = Zadanie1()
    x = 1.5; %pocz¹tkowe zainicjalizowanie zmiennej
    g = 1.0;
    while( x > 1 ) %przechodzenie przez pêtle i dzielenie epsilona 
        g = g/2;   %tak d³ugo a¿ dodanie go nie wp³ynie na wynik
        x = 1.0 + g;
    end
    g = g*2; %jeden przebieg pêtli w ty³
    fprintf('Wyznaczony epsilon maszynowy: %d \n',g);
end
