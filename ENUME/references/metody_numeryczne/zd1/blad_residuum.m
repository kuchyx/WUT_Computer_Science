function [r] = blad_residuum(r)
    % norma druga residuum
    r = r.^2;
    r = sqrt(sum(r));
end