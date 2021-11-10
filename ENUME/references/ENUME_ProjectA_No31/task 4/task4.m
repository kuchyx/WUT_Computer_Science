clear all;

A = [23 12 3 5 10;
    12 14 8 5 22;
    3 8 9 13 11;
    5 5 13 10 17;
    10 22 11 17 25];

[eigNS, iteNS, finNS] = eigenvalueQRnoshift(A);
[eigS, iteS, finS] = eigenvalueQRshift(A);
eigE = eig(A);