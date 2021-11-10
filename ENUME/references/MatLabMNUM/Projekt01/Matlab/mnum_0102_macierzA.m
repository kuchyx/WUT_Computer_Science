%% 
% tworzenie macierzy typu a o zadanym rozmiarze rozmiar_a z wykorzystaniem 
% prealokacji pamiêci

rozmiar_a = 10;

macierz_a = zeros(rozmiar_a);

for j = 1:rozmiar_a
    for i = 1:rozmiar_a
        if (i < j-1) || (i > j+1)
            macierz_a(i,j) = 0;
        elseif (i == j-1) || (i == j+1)
            macierz_a(i,j) = 2;
        else
            macierz_a(i,j) = 6;
        end
    end
end

%macierz_a
%% 
% wyrazy wolne a

wolne_a = zeros(rozmiar_a, 1);
% deklaracja pierwszej waroœci, aby pozostale
% mogly powstac przez dodawanie zamiast mnozenia
wolne_a(1) = 9.5;

for i = 2:rozmiar_a
    wolne_a(i) = wolne_a(i-1) + 0.5;
end

%wolne_a