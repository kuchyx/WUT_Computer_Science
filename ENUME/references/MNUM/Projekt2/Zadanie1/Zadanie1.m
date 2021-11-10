function [] = Zadanie1(czyPrzesun,czySym)
    % czyPrzesun - wartosc 1 jesli wersja z przesunieciami
    % czySym - wartosc 1 jestli macierz symetryczna

    iterQR = 0; %liczba wartosci wlasnej QR bez przesuniec
    iterQRS = 0; %liczba wartosci wlasnej QR z przesunieciami
    
    timeQR = 0; %czas wykonania alg QR bez przesuniec
    timeQRS = 0; %czas wykonania alg QR z przesunieciami
    timeE = 0; %czas wykonania alg eig() wbudowanym w MATLAB
    
    SIZE = 20; %rozmiar maciery
    matrixNumberR = 30; %ilosc losowych macierzy
    
    ILEMACQR = 0;
    ILEMACQRS = 0;

    %Generowanie danych
    for i=1:matrixNumberR
        
        A = genA(SIZE,czySym);
        tolerance = 0.0000001;
        imax = 200;
        
        start = tic;
        [~,D] = eig(A);
        timeEig = toc(start);
        timeE = timeE + timeEig;
        
        if czyPrzesun == 1 %QR z przesunieciami (eignes - wartWlasne)
            [eigens, iteracje, time, ok] = zPrzesun(A, tolerance, imax);
            if ok == 1
                ILEMACQRS = ILEMACQRS + 1;
                iterQRS = iterQRS + iteracje;
                timeQRS = timeQRS + time;
            end
        else %QR bez przesuniec  (eigens - wartWlasne)
            [eigens, iteracje, time, ok] = bezPrzesun(A, tolerance, imax);
            if ok == 1
                ILEMACQR = ILEMACQR + 1;
                iterQR = iterQR + iteracje;
                timeQR = timeQR + time;
            end 
        end
    end
    
    fprintf('Ilosc macierzy: %d\n',matrixNumberR);
    fprintf('Wielkosc macierzy: %d\n',SIZE);
    SREDNIAczasEig = timeE / matrixNumberR;
    
    if czyPrzesun == 1
        %Wyniki z przesunieciami:
        SREDNIAQRSI = iterQRS / ILEMACQRS;
        SREDNIAczasQRS = timeQRS / ILEMACQRS;
        fprintf('Z przesunieciami:\n');
        fprintf('Ilosc zkonczonych sukcesem: %d\n', ILEMACQRS);
        fprintf('Srednia ilosci iteracji %d\n',SREDNIAQRSI);
        fprintf('Sredni czas obliczen %d\n',SREDNIAczasQRS);
    else
        %Wyniki bez przesuniec:
        SREDNIAQRI = iterQR / ILEMACQR;
        SREDNIAczasQR = timeQR / ILEMACQR;
        fprintf('Bez przesuniec:\n');
        fprintf('Ilosc zkonczonych sukcesem: %d\n', ILEMACQR);
        fprintf('Srednia ilosci iteracji %d\n',SREDNIAQRI);
        fprintf('Sredni czas obliczen %d\n',SREDNIAczasQR);
    end
    
    fprintf('Sredni czas obliczen eig %d\n',SREDNIAczasEig);
    d = diag(D);
    disp(sort(d));
    disp(sort(eigens));
end