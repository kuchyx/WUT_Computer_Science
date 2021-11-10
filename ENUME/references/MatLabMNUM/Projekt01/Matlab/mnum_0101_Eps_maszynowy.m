%% 
% obliczenie epsa maszynowego

i = 0;
while (1 + 2^i > 1)
    i = i - 1;
end
i = i + 1;

fprintf('epsilon maszynowy to %e\n', 2^i);
fprintf('czyli 2^%d\n', i);
%% 
% wywolanie funkcji matlaba obliczajacej eps maszynowy

fprintf('epsilon maszynowy wyznaczony przez MatLaba to: %e\n', eps);
%% 
% sprawdzenie

if (eps == 2^i)
    disp("eps wyznaczony poprawnie")
else
    disp("blad wyznaczenia epsa")
end