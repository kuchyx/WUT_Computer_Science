clear;
clc;

% measurements
x = -5:1:5;
y = [23.4523 11.9631 4.4428 1.1010 -1.6826 -1.2630 -0.0357 -1.3156 -3.4584 -8.4294 -18.4654];

n = 9; % polynomial order

[a, residuum] = ls_approximation(n, x, y);

% draw graph
x_draw = -5:0.1:5;
scatter(x, y, 'filled')
hold on
appValue = polyval(a, x_draw);
plot(x_draw, appValue);
grid on
title("Approximation for polynomial of order: " + n);
xlabel('x');
ylabel('y');
legend("Samples", "Approximation");
hold off