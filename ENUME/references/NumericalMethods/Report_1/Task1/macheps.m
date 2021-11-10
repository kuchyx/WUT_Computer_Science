clear variable
clear all 
clc

% ----- Matlab build-in function ----- %
machEps_1 = eps;

% ----- General solution ----- %
machEps_2 = 2^(-52);

% ----- Solution when matissa is unknown ----- %
machEps_3 = 1;

while 1.0 + (machEps_3 / 2) > 1.0
    machEps_3 = machEps_3 / 2;
end