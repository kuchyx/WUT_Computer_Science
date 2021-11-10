%% 
% dane z zadania

clear;
clc;

A = [12 2  1 -6; 
     4 -15 2 -5;
     2 -1  8 -2;
     5 -2  1 -8];
b = [6; 8; 20; 2];
e = 0.01;
%% 
% wywolanie funkcji

display(gauss_seidel(A, b, e));
norma_residuum(A, gauss_seidel(A, b, e), b)
%% 
% test dla macierzy z zad 2

blad_res_a = zeros(5,2);
blad_res_b = zeros(5,2);
blad_res_c = zeros(5,2);

for r = 5:3:15
    for typ = 1:3
        if(typ == 1)
            temp = macierzA(r);
        elseif(typ == 2)
            temp = macierzB(r);
        elseif(typ == 3)
            temp = macierzC(r);
        end
        A = temp(:, 1:end-1);
        b = temp(:,end);
        % wywolanie funkcji Gaussa oraz residuum
        rozwiazanie = gauss_seidel(A, b, e);
        a = norma_residuum(A, rozwiazanie, b);
        
        if(typ == 1)
            blad_res_a((r+1)/3,:) = [a, r];
        elseif(typ == 2)
            blad_res_b((r+1)/3,:) = [a, r];
        elseif(typ == 3)
            blad_res_c((r+1)/3,:) = [a, r];
        end
    end
end
%% 
% wyswietlenie bledow

blad_res_a
blad_res_b
blad_res_c

%% 
% algorytm

function gs = gauss_seidel(wspolczynniki, rozw, err)
    rozmiar = (size(wspolczynniki,1));
    x = zeros(rozmiar, 1);
    blad = zeros(rozmiar, 1);
    % zeby warunek petli byl spelniony
    blad(1) = 100;
    % rozklad L + D + U
    L = zeros(rozmiar);
    U = zeros(rozmiar);
    for i = 1:rozmiar
        L(i, 1:i-1) = wspolczynniki(i, 1:i-1);
        U(i, i+1:rozmiar) = wspolczynniki(i, i+1:rozmiar);
    end
    % wyznaczenie D^-1
    D_odwr = zeros(rozmiar);
    for i = 1:rozmiar
        D_odwr(i,i) = 1/wspolczynniki(i,i);
    end
    % wyznaczenie D^-1 * b, D^-1 * L, D^-1 * U
    rozw = D_odwr * rozw;
    L = D_odwr * L;
    U = D_odwr * U;
    % polaczenie odwroconych macierzy L i U
    % dla latwosci wykonywania petli
    LU = (-1) * (L + U);
    
    while(max(abs(blad)) > err)
        for i = 1:rozmiar
            poprzednia_wartosc = x(i);
            x(i) = rozw(i);
            for j = 1:(rozmiar)
                x(i) = x(i) + LU(i,j) * x(j);
            end
            blad(i) = (x(i)-poprzednia_wartosc)/x(i);
        end
    end
    gs = x;
end
%% 
% norma residuum

function nr = norma_residuum(wspolczynniki, x, rozw)
    residuum = wspolczynniki*x - rozw;
    nr = norm(residuum);
end
%% 
% tworzenie macierzy typu a o zadanym rozmiarze rozmiar_a

function mac_a = macierzA(rozmiar_a)
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
    
    wolne_a = zeros(rozmiar_a, 1);
    % deklaracja pierwszej waroœci, aby pozostale
    % mogly powstac przez dodawanie zamiast mnozenia
    wolne_a(1) = 9.5;
    
    for i = 2:rozmiar_a
        wolne_a(i) = wolne_a(i-1) + 0.5;
    end
    
    mac_a = [macierz_a, wolne_a];
end
%% 
% tworzenie macierzy typu b o zadanym rozmiarze rozmiar_b

function mac_b = macierzB(rozmiar_b)
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
    
    wolne_b = zeros(rozmiar_b, 1);
    % deklaracja pierwszej waroœci, aby pozostale
    % mogly powstac przez dodawanie zamiast mnozenia
    wolne_b(1) = -2.5;
    
    for i = 2:rozmiar_b
        wolne_b(i) = wolne_b(i-1) + 0.5;
    end
    
    mac_b = [macierz_b, wolne_b];
end
%% 
% tworzenie macierzy typu c o zadanym rozmiarze rozmiar_c

function mac_c = macierzC(rozmiar_c)
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
    wolne_c = zeros(rozmiar_c, 1);
    
    % deklaracja pierwszej waroœci, aby pozostale
    % mogly powstac przez dodawanie zamiast mnozenia
    wolne_c(1) = 0.5;
    
    for i = 3:2:rozmiar_c
        wolne_c(i) = wolne_c(i-2) + 1;
    end

    mac_c = [macierz_c, wolne_c];
end