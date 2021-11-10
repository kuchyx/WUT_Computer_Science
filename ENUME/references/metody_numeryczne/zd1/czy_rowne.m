function czy_rowne(X, Y)
    tolerancja = 1e-6;
    if abs(X-Y) < tolerancja
        disp('Równe!');
    else
        disp('Nie równe');
    end
end