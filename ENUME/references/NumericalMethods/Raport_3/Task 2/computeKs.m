function [k_1, k_2] = computeKs(fun_1, fun_2, x, y, h)

    %1st Ks
    k_1(1) = fun_1(x, y);
    k_2(1) = fun_2(x, y);

    %2nd Ks
    k_1(2) = fun_1(x + 0.5 * h * k_1(1), y + 0.5 * h * k_2(1));
    k_2(2) = fun_2(x + 0.5 * h * k_1(1), y + 0.5 * h * k_2(1));

    %3rd Ks
    k_1(3) = fun_1(x + 0.5 * h * k_1(2), y + 0.5 * h * k_2(2));
    k_2(3) = fun_2(x + 0.5 * h * k_1(2), y + 0.5 * h * k_2(2));
    
    %4th Ks
    k_1(4) = fun_1(x + h * k_1(3), y + h * k_2(3));
    k_2(4) = fun_2(x + h * k_1(3), y + h * k_2(3));
    
end