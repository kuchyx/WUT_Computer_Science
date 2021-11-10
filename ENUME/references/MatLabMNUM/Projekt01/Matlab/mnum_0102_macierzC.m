%% 
% tworzenie macierzy typu c o zadanym rozmiarze rozmiar_c z wykorzystaniem 
% prealokacji pamiêci

rozmiar_c = 4;

macierz_c = zeros(rozmiar_c);

% wygenerowanie pierwszej kolumny
% kolumny od 2 do end bêd¹ przekopiowywac
% (rozmiar_c-1) wartosci z poprzednich kolumn
% i wyliczac jedna wlasna
for i = 1:rozmiar_c
    macierz_c(i, 1) = 4/(5*i);
end

% wykorzystanie wartosci z pierwszej kolumny
for j = 2:rozmiar_c
    for i = 1:(rozmiar_c-1)
        macierz_c(i,j) = macierz_c(i+1, j-1);
    end
    macierz_c(rozmiar_c, j) = 4/(5*(rozmiar_c+j-1));
end
%% 
% wyrazy wolne c

wolne_c = zeros(rozmiar_c, 1);

% deklaracja pierwszej waroœci, aby pozostale
% mogly powstac przez dodawanie zamiast mnozenia
wolne_c(1) = 0.5;

for i = 3:2:rozmiar_c
    wolne_c(i) = wolne_c(i-2) + 1;
end

wolne_c