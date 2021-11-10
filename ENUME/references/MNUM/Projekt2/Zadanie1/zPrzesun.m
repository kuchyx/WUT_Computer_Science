function [wartWlasne, iteracje, time, ok] = zPrzesun(A,tolerance,imax)
    % ok - czy funkcja wykonala sie z przekroczeniem imax
    % tolerance - toleracnaj jako górna granica wartoœci elementów zerowanych
    start = tic;
    ok = 1; 
    n = size(A,1);
    wartWlasne = diag(zeros(n));
    iteracje = 0;
    INITIALsubmatrix = A;
    for k=n:-1:2
        DK = INITIALsubmatrix(1:k, 1:k); %macierz potrzebna do wyznaczenia wartosci w1
        i = 0;
       
        while i <= imax && max(abs(DK(k,1:k-1))) > tolerance
            
            ev = roots([1, -(DK(k-1,k-1)+DK(k,k)), DK(k,k)*DK(k-1,k-1)-DK(k,k-1)*DK(k-1,k)]);
            if abs(ev(1)-DK(k,k)) < abs(ev(2)-DK(k,k))
                shift = ev(1); % nasze przesuniecie jako najbli¿sza DK(k,k) wartosc 
                               % wlasna analizowanej macierzy 2x2
            else
                shift = ev(2);
            end
            DK = DK - eye(k)*shift; %nasza macierz przesuniêta
            [Q1, R1] = qrZmodGS(DK); %faktoryzacja QR
            DK = R1*Q1 + eye(k)*shift; %macierz przekszta³cona
            i = i+1;
            
            iteracje = iteracje + 1;
        end
        
        if i > imax
            ok = 0;
            break;
        end
        wartWlasne(k) = DK(k,k);
        
        if k>2
            INITIALsubmatrix = DK(1:k-1,1:k-1); %definicja macierzy
        else
            wartWlasne(1) = DK(1,1); %ostatnia wartosc wlasna
        end
    end
    time = toc(start);
end