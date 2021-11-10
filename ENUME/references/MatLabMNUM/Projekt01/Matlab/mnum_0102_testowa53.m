%% 
% probne dane

% pierwsze 3 kolumny - lewa strona rownania - niewiadome
test5 = true;

if(test5)
    wspolczynniki = [2  -1  4  1 -1;
                    -1   3 -2 -1  2;
                     5   1  3 -4  1;
                     3  -2 -2 -2  3;
                    -4  -1 -5  3 -4];
    rozw = [7; 1; 33; 24; -49];
else
    wspolczynniki = [3 1 6; 
                     2 1 3; 
                     1 1 1];
    rozw = [2; 7; 4];
end

rozmiar = (size(wspolczynniki,1));
wspolczynniki