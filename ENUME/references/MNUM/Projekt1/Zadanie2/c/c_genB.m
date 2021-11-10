function [b] = c_genB(n)
    b = 1:1:n;
    b = (1./b).*(5/3); %odwrócenie i przemno¿enie ka¿dego elementu
end