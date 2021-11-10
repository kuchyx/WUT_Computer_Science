clear;
clc;

dx_1 = @(x_1, x_2) x_2 + x_1 * (0.5 - x_1^2 - x_2^2);
dx_2 = @(x_1, x_2) -x_1 + x_2 * (0.5 - x_1^2 - x_2^2);

%initial conditions
init_x_1 = 8;
init_x_2 = 7;

h = 0.25; % step

err_fac = (863/60480) / ((-95/288) + (863 / 60480));

x_1(1) = init_x_1;
x_2(1) = init_x_2;

betaE = [1901, -2774, 2616, -1274, 251];
betaE = betaE / 720;

betaI = [475, 1427, -798, 482, -173, 27];
betaI = betaI / 1440;

for i = 1:5
    [k_1, k_2] = computeKs(dx_1, dx_2, x_1(i), x_2(i), h);
    x_1(i + 1) = x_1(i) + h * (k_1(1) + 2 * k_1(2) + 2 * k_1(3) + k_1(4)) / 6; 
    x_2(i + 1) = x_2(i) + h * (k_2(1) + 2 * k_2(2) + 2 * k_2(3) + k_2(4)) / 6;
end

for i = 6:ceil(20 / h)
    sum_x_1 = 0;
    sum_x_2 = 0;
    for j = 1:5
        sum_x_1 = sum_x_1 + betaE(j) * dx_1(x_1(i - j), x_2(i - j));
        sum_x_2 = sum_x_2 + betaE(j) * dx_2(x_1(i - j), x_2(i - j));
    end
    
    temp_x_1 = x_1(i - 1) + h * sum_x_1;
    temp_x_2 = x_2(i - 1) + h * sum_x_2;
    
    sum_x_1 = 0;
    sum_x_2 = 0;
    for j = 1:5
        sum_x_1 = sum_x_1 + betaI(j + 1) * dx_1(x_1(i - j), x_2(i - j));
        sum_x_2 = sum_x_2 + betaI(j + 1) * dx_2(x_1(i - j), x_2(i - j));
    end
    
    x_1(i) = x_1(i - 1) + h * sum_x_1 + h * betaI(1) * dx_1(temp_x_1, temp_x_2);
    x_2(i) = x_2(i - 1) + h * sum_x_2 + h * betaI(1) * dx_2(temp_x_1, temp_x_2);
    
    err_x_1 = err_fac * (temp_x_1 - x_1(i));
    err_x_2 = err_fac * (temp_x_2 - x_2(i));
end

% plot(x_1, x_2, 'b')
% title("Adams PC (P5EC5E) method with constant step size = " + h + "vs ode45");
% xlabel('x1'); ylabel('x2');
% grid on;
% hold on
% [t, y] = ode45(@odefun, [0,20], [8, 7]);
% plot(y(:,1), y(:,2), 'r');
%  xlabel('x_1'); ylabel('x_2'); 
% legend('Blue - Adams PC (P5EC5E)', 'Red - ode45');
% hold off

[N, M] = size(x_1);
plot(0:(M-1), x_1, 'g')
title("Adams PC (P5EC5E) solution versus time for step size: " + h);
xlabel('t'); ylabel('Solution'); 
grid on;
hold on;
[n, m] = size(x_2);
plot(0:(M-1), x_2, 'r')
legend('Green x_1', 'Red - x_2');



