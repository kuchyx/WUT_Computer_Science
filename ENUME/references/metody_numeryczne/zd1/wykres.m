function wykres(num, dane)
    n = 10;
    idx = 0; 
    
    if dane == 1
        while idx < num 
            [A,b,n] = dane1(n);
            try 
                [X,U, b] = zd2(A,b,n);
                r = blad_residuum(b - U * X);
                dane_n(idx) = n; 
                dane_r(idx) = r; 
            catch
                if idx > 5
                    break;
                end
            end
            idx = idx+1;
            n = n*2; 
        end
    elseif dane == 2
        while idx < num 
            [A,b,n] = dane2(n);
            try 
                [X,U, b] = zd2(A,b,n);
                r = blad_residuum(b - U * X);
                dane_n(idx) = n; 
                dane_r(idx) = r; 
            catch
                if idx > 5
                    break;
                end
            end
            idx = idx+1;
            n = n*2; 
        end
    elseif dane == 3
        while idx < num 
            [A,b,n] = dane3(n);
            disp(idx);
            try 
                [X,U, b] = zd2(A,b,n);
                r = blad_residuum(b - U * X);
                dane_n(idx) = n; 
                dane_r(idx) = r; 
            catch
                if idx > 5
                    break;
                end
            end
            idx = idx+1;
            n = n*2; 
        end
    else
        error('Bledny index danych');
    end
    try
        plot(dane_n, dane_r,'b-');
    catch
    	return;
    end
    hold on;
    plot(dane_n, dane_r, 'r*');
    xlabel('n') % x-axis label
    ylabel('b³¹d') % y-axis label
    
end