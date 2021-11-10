function [] = task2main()
    iter = 8;
    linErr = zeros(iter, 1);
    qrErr = zeros(iter, 1);
    sizes = zeros(iter, 1);
    for i = 1:iter
        size = 2^(i-1)*10;
        sizes(i) = size;
        fprintf('Rozmiar %d\n', size);
        [A, b] = generateExamples(2, size);
        X = linsolve(A'* A, A' * b);
        residuumErr = calculateNorm(A*X-b);
        linErr(i) = residuumErr;
        fprintf('Uklad rownan normalnych, blad residuum: %d\n', residuumErr);
        [Q, R] = qr(A);
        X = linsolve(R, Q' * b);
        residuumErr = calculateNorm(A*X-b);
        qrErr(i) = residuumErr;
        fprintf('Uklad rownan z wykorzystaniem QR, blad residuum: %d\n', residuumErr);
    end
    display(qrErr);
    display(linErr);
    figure();
    plot(sizes, qrErr, 'Marker', 'o', 'MarkerSize', 4);
    title('Blad przy ukladzie QR');
    figure();
    plot(sizes, linErr, 'Marker', 'o', 'MarkerSize', 4);
    title('Blad przy ukladzie rownan normalnych');
end