function [dydt] = odefun(t, y)
       dydt = [y(2) + y(1) * (0.5 - y(1) * y(1) - y(2) * y(2));
                -y(1) + y(2) * (0.5 - y(1) * y(1) - y(2) * y(2))]; 
end