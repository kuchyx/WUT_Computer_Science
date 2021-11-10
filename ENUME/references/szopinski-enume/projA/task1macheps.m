% ENUME MICHAŁ SZOPIŃSKI
% PROJECT A NUMBER 62
% TASK 1
% https://github.com/Lachcim/szopinski-enume

% first candidate is 2^0
foundEps = 1;

% decrement exponent until floating point underflow occurs
while foundEps / 2 + 1 > 1
    foundEps = foundEps / 2;
end

disp(['Found epsilon is ', num2str(foundEps)]);
disp(['Epsilon is ', num2str(eps)]);
