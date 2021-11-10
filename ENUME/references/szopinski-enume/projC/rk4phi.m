% ENUME MICHAŁ SZOPIŃSKI
% PROJECT C NUMBER 60
% https://github.com/Lachcim/szopinski-enume

% calculate the phi for RK4 algorithms
function phi = rk4phi(fun, stepval, stepsize)
    k1 = fun(stepval);
    k2 = fun(stepval + 0.5 * stepsize * k1);
    k3 = fun(stepval + 0.5 * stepsize * k2);
    k4 = fun(stepval + stepsize * k3);
    phi = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
end
