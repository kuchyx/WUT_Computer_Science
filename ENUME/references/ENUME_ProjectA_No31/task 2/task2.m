clear all;

repeatSmall = 4;
repeatBig = 9;
repeatEqua = 10;
%-----TASK 2A
%big graph
repeats = zeros(1,repeatBig);
errors = zeros(1,repeatBig);
n = repeatEqua;
for i = 1:1:repeatBig
    [A, b] = matrixGen2a( n );
    [x] = solveIndicated( A, b );
    repeats(i) = n;
    errors(i) = euclideanNorm( A*x - b );
    n = n*2;
end
figure(1)
plot(repeats, errors, 'o');
title(sprintf("Errors in task 2a, up to %d equations", n/2));
xlabel('Number of equations');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(1, "./plots/2aBIG.fig");
saveas(1, "./plots/2aBIG.png");
%small
repeats = zeros(1,repeatSmall);
errors = zeros(1,repeatSmall);
n = repeatEqua;
for i = 1:1:repeatSmall
    [A, b] = matrixGen2a( n );
    [x] = solveIndicated( A, b );
    repeats(i) = n;
    errors(i) = euclideanNorm( A*x - b );
    n = n*2;
end
figure(2)
plot(repeats, errors, 'o');
title(sprintf("Errors in task 2a, up to %d equations", n/2));
xlabel('Number of equations');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(2, "./plots/2aSMALL.fig");
saveas(2, "./plots/2aSMALL.png");
[Aa, ba] = matrixGen2a( 10 );
[xa, AaT, baT] = solveIndicated( Aa, ba );
Ra = Aa*xa - ba;
%TODO: RESIDUAL
repeatResidual = 10;
residualA = zeros(1,repeatResidual+1);
residualA(1) = euclideanNorm(Ra);
xaR = xa;
RaR = Ra;
for i = 1:1:repeatResidual
    [RaR, xaR] = residualCorrection(RaR,xaR,AaT,ba,Aa);
    residualA(i+1) = euclideanNorm(RaR);
end
figure(5)
plot(0:1:repeatResidual,residualA,'o');
title("Results of residual correction");
xlabel('Iteration');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(5, "./plots/residualA.fig");
saveas(5, "./plots/residualA.png");
%-----TASK 2B
%big graph
repeats = zeros(1,repeatBig);
errors = zeros(1,repeatBig);
n = repeatEqua;
for i = 1:1:repeatBig
    [A, b] = matrixGen2b( n );
    [x] = solveIndicated( A, b );
    repeats(i) = n;
    errors(i) = euclideanNorm( A*x - b );
    n = n*2;
end
figure(3)
plot(repeats, errors, 'o');
title(sprintf("Errors in task 2b, up to %d equations", n/2));
xlabel('Number of equations');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(3, "./plots/2bBIG.fig");
saveas(3, "./plots/2bBIG.png");
%small
repeats = zeros(1,repeatSmall);
errors = zeros(1,repeatSmall);
n = repeatEqua;
for i = 1:1:repeatSmall
    [A, b] = matrixGen2b( n );
    [x] = solveIndicated( A, b );
    repeats(i) = n;
    errors(i) = euclideanNorm( A*x - b );
    n = n*2;
end
figure(4)
plot(repeats, errors, 'o');
title(sprintf("Errors in task 2b, up to %d equations", n/2));
xlabel('Number of equations');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(4, "./plots/2bSMALL.fig");
saveas(4, "./plots/2bSMALL.png");
[Ab, bb] = matrixGen2b( 10 );
[xb, AbT, bbT] = solveIndicated( Ab, bb );
Rb = Ab*xb - bb;
%TODO: RESIDUAL
residualB = zeros(1,repeatResidual+1);
residualB(1) = euclideanNorm(Rb);
xbR = xb;
RbR = Rb;
for i = 1:1:repeatResidual
    [RbR, xbR] = residualCorrection(Rb,xb,AbT,bb,Ab);
    residualB(i+1) = euclideanNorm(RbR);
end
figure(6)
plot(0:1:repeatResidual,residualB,'o');
title("Results of residual correction");
xlabel('Iteration');
ylabel('Euclidean norm of errors');
grid on;
box off;
saveas(6, "./plots/residualB.fig");
saveas(6, "./plots/residualB.png");
