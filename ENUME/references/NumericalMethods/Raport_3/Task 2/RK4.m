clear;
clc;

dx_1 = @(x_1, x_2) x_2 + x_1 * (0.5 - x_1^2 - x_2^2);
dx_2 = @(x_1, x_2) -x_1 + x_2 * (0.5 - x_1^2 - x_2^2);

%initial conditions
init_x_1 = 8;
init_x_2 = 7;

h = 0.025; % step

x_1 = zeros(1, 20/h+1);
x_2 = zeros(1, 20/h+1);
err_x_1 = zeros(1, 20/h+1);
err_x_2 = zeros(1, 20/h+1);
x_1(1) = init_x_1;
x_2(1) = init_x_2;


for i = 1:1:ceil(20 / h)
    
    [k_1, k_2] = computeKs(dx_1, dx_2, x_1(i), x_2(i), h);
    
    x_1(i+1) = x_1(i) + h * (k_1(1) + 2 * k_1(2) + 2 * k_1(3) + k_1(4)) / 6;
    x_2(i+1) = x_2(i) + h * (k_2(1) + 2 * k_2(2) + 2 * k_2(3) + k_2(4)) / 6;
    
    err_x_1(i) = (16/15)*abs(x_1(i+1) - x_1(i));
    err_x_2(i) = (16/15)*abs(x_2(i+1) - x_2(i));
    
end

% plot(x_1, x_2, 'b'); grid on; title("Runge-Kutta method with constant step size = " + h + "vs ode45"); xlabel('x_1'); ylabel('x_2'); 
% hold on
% [t, y] = ode45(@odefun, [0,20], [8, 7]);
% plot(y(:,1), y(:,2), 'r');
% %title("Ode45"); xlabel('x_1'); ylabel('x_2'); 
% legend('Blue - Rugge-Kutta', 'Red - ode45');
% hold off

[N, M] = size(x_1);
plot(0:(M-1), x_1, 'g')
title("RK4 solution versus time for step size: " + h);
xlabel('t'); ylabel('Solution'); 
grid on;
hold on;
[n, m] = size(x_2);
plot(0:(M-1), x_2, 'r')
legend('Green x_1', 'Red - x_2');







