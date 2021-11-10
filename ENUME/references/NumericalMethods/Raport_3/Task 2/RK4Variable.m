clear;
clc;

dx_1 = @(x_1, x_2) x_2 + x_1 * (0.5 - x_1^2 - x_2^2);
dx_2 = @(x_1, x_2) -x_1 + x_2 * (0.5 - x_1^2 - x_2^2);

%Relative tolerance user definied
epsr = 1e-6;
%Absolute tolerance user definied
epsa = 1e-6;

%initial conditions
x_1 = 8;
x_2 = 7;

i = 1;

x_1_val(1) = x_1;
x_2_val(1) = x_2;

h = 0.0001; %Initial step
steps(i) = h; 

a = 0; %initial point [0, 20]
while (a < 20)
    [k_1, k_2] = computeKs(dx_1, dx_2, x_1, x_2, h);
    
    temp_x_1 = x_1;
    temp_x_2 = x_2;
    
    x_1 = x_1 + h * (k_1(1) + 2 * k_1(2) + 2 * k_1(3) + k_1(4)) / 6;
    x_2 = x_2 + h * (k_2(1) + 2 * k_2(2) + 2 * k_2(3) + k_2(4)) / 6;
    
    x_1_val(i + 1) = x_1;
    x_2_val(i + 1) = x_2;
    
    %1st half-step
    [k_1, k_2] = computeKs(dx_1, dx_2, x_1, x_2, 0.5 * h);
     
    temp_1 = x_1 + 0.5 * h * (k_1(1) + 2 * k_1(2) + 2 * k_1(3) + k_1(4)) / 6;
    temp_2 = x_2 + 0.5 * h * (k_2(1) + 2 * k_2(2) + 2 * k_2(3) + k_2(4)) / 6;
    
    %2nd half-step
    [k_1, k_2] = computeKs(dx_1, dx_2, temp_1, temp_2, 0.5 * h);
    
    temp_1 = temp_1 + 0.5 * h * (k_1(1) + 2 * k_1(2) + 2 * k_1(3) + k_1(4)) / 6;
    temp_2 = temp_2 + 0.5 * h * (k_2(1) + 2 * k_2(2) + 2 * k_2(3) + k_2(4)) / 6;
    
    errors(i, 1) = (temp_1 - x_1) / 120;
    errors(i, 2) = (temp_2 - x_2) / 120;
    
    eps_1 = abs(temp_1) * epsr + epsa;
    eps_2 = abs(temp_2) * epsr + epsa;
    
    alpha_1 = (eps_1 / abs(errors(i, 1)))^(1/5);
    alpha_2 = (eps_2 / abs(errors(i, 2)))^(1/5);
    
    alpha = min(alpha_1, alpha_2);
    
    h_new = 0.9 * alpha * h; %s for RK4 estimated 0.9 estimated.
    
    if (0.9 * alpha >= 1)
        if (a + h >= 20)
            break;
        else
            a = a + h;
            h = min([h_new, 5 * h, 20 - a]);
            i = i + 1;
            steps(i) = h;
            continue;
        end
    else
        if (h_new < 0)
            error('Solution not possible with assumed accuacy.');
        else
            h = h_new;
            i = i + 1;
            steps(i) = h;
        end
    end
end

% plot(x_1_val, x_2_val, 'b'); grid on;
% hold on
% [t, y] = ode45(@odefun, [0,20], [8, 7]);
% plot(y(:,1), y(:,2), 'r');
% title("RK4 Variable for initial step 0.0001"); xlabel('x_1'); ylabel('x_2'); 
% legend('Blue - RK4 Variable', 'Red - ode45');
% hold off

% [n, m] = size(x_1_val);
% plot(0:(m-1), x_1_val, 'g')
% title(['RK4 method with variable step size solution versus time']);
% xlabel('t'); ylabel('x_1 - green, x_2 - red');
% grid on;
% hold on;
% [n m] = size(x_2_val);
% plot(0:(m-1), x_2_val, 'r')

[n, m] = size(errors);
plot(0:(n-1), errors(:, 1), 'k')
title('RK4 method with variable step size error versus time');
xlabel('t'); ylabel('x1 - black, x2 - red');
grid on;
hold on;
plot(0:(n-1), errors(:, 2), 'r')

