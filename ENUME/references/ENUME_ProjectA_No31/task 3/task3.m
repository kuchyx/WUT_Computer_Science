clear all;
%First case
A = [20 10 8 1;
    1 10 6 2;
    2 1 8 4;
    1 1 1 4;];
b = [100; 80; 60; 40];
%From task 2
[Aa, ba] = matrixGen2a( 10 );
[Ab, bb] = matrixGen2b( 10 );

[xJ, errorsJ] = JacobiMethod(A, b);
[xGS, errorsGS] = GaussSeidelMethod(A, b);
[xJa, errorsJa] = JacobiMethod(Aa, ba);
[xGSa, errorsGSa] = GaussSeidelMethod(Aa, ba);
[sr] = JacobiMethod(Ab, bb);

%Plots
figure(1);
plot(1:1:length(errorsJ), errorsJ, '.')
title("Jacobi method, matrices 3");
xlabel("Iteration"); ylabel("Euclidean norm of errors");
saveas(1, "./plots/Jacobi3.fig");
saveas(1, "./plots/Jacobi3.png");

figure(2);
plot(1:1:length(errorsJa), errorsJa, '.')
title("Jacobi method, matrices 2a");
xlabel("Iteration"); ylabel("Euclidean norm of errors");
saveas(2, "./plots/Jacobi2a.fig");
saveas(2, "./plots/Jacobi2a.png");

figure(3);
plot(1:1:length(errorsGS), errorsGS, '.')
title("Gauss-Seidel method, matrices 3");
xlabel("Iteration"); ylabel("Euclidean norm of errors");
saveas(3, "./plots/GaussSeidel3.fig");
saveas(3, "./plots/GaussSeidel3.png");

figure(4)
plot(1:1:length(errorsGSa), errorsGSa, '.')
title("Gauss-Seidel method, matrices 2a");
xlabel("Iteration"); ylabel("Euclidean norm of errors");
saveas(4, "./plots/GaussSeidel2a.fig");
saveas(4, "./plots/GaussSeidel2a.png");

figure(5);
hold on;
plot(1:1:length(errorsJ), errorsJ, 'o')
plot(1:1:length(errorsGS), errorsGS, 'o')
legend('Jacobi', 'Gauss-Seidel');
title("Jacobi and Gauss-Seidel comparison");
xlabel("Iteration"); ylabel("Euclidean norm of errors");
xlim([0 40]);
saveas(5, "./plots/compare.fig");
saveas(5, "./plots/compare.png");