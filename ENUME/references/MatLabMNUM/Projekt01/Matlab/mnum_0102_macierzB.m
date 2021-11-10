%% 
% tworzenie macierzy typu b o zadanym rozmiarze rozmiar_b z wykorzystaniem 
% prealokacji pamiêci

rozmiar_b = 5;

macierz_b = zeros(rozmiar_b);

% wygenerowanie pierwszej i ostatniej kolumny pozwoli w pozniejszych
% etapach przekopiowywac wartosci zamiast obliczac je na nowo
macierz_b(1,1) = 1/8;
macierz_b(end,end) = 1/8;
% pierwsza kolumna
macierz_b(2, 1) = 6;
for i = 3:rozmiar_b
    macierz_b(i, 1) = macierz_b(i-1, 1) + 5;
end
% ostatnia kolumna
macierz_b(end - 1, end) = -4;
for i = (rozmiar_b-2):-1:1
    macierz_b(i, end) = macierz_b(i + 1, end) - 5;
end

% wykorzystanie wartosci ze skrajnych kolumn
for j = 2:(rozmiar_b-1)
    for i = 1:rozmiar_b
        if (i < j)
            macierz_b(i,j) = macierz_b(end-(j-i),end);
        else
            macierz_b(i,j) = macierz_b(i-1,j-1);
        end
    end
end

macierz_b
%% 
% wyrazy wolne b

wolne_b = zeros(rozmiar_b, 1);

% deklaracja pierwszej waroœci, aby pozostale
% mogly powstac przez dodawanie zamiast mnozenia
wolne_b(1) = -2.5;

for i = 2:rozmiar_b
    wolne_b(i) = wolne_b(i-1) + 0.5;
end