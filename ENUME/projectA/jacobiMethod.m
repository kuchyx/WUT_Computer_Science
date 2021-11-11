function x = jacobiMethod(Matrix, Vector)
    [L, D, U, initial_x, whichIterationAreWeOn, currentError, demandedTolerance] = initializeValues(Matrix)
    x = jacobiLoop(Matrix, L, D, U, initial_x, whichIterationAreWeOn, currentError, demandedTolerance, Vector);
    disp("Final demandedTolerance");
    disp(demandedTolerance);
    disp("Final Iteration: ");
    disp(whichIterationAreWeOn);
    disp("A\b matlab:");
    disp(Matrix \ Vector);
end

function [L, D, U, initial_x, whichIterationAreWeOn, currentError, demandedTolerance] = initializeValues(Matrix)
    [Rows, ~] = size(Matrix);
    [L, D, U] = decomposeMatrix(Matrix);
    initial_x = ones(Rows, 1);
    whichIterationAreWeOn = 0;
    currentError = inf; % We set it to inf so that the algorithm will always start
    % (See condition below)
    demandedTolerance = 1e-10;
end

function [L, D, U] = decomposeMatrix(Matrix)
    D = diag(diag(Matrix));
    U = triu(Matrix, 1); % Generates upper triangular part of matrix
    % where the second variable denotes on which diagonal of matrix should we
    % start
    L = tril(Matrix, -1); % Generates lower triangular part of matrix
    % where the second variable denotes on which diagonal of matrix should we
    % start
end

function x = jacobiLoop(Matrix, L, D, U, initial_x, whichIterationAreWeOn, currentError, demandedTolerance, Vector)
    while currentError >= demandedTolerance
        x = jacobiEquation(D, L, U, initial_x, Vector);
        currentError = norm(x - initial_x);
        %disp(currentError);
        if currentError <= demandedTolerance
            currentError = norm(Matrix*x-Vector);
            %disp(currentError);
            if currentError <= demandedTolerance
                break;
            else 
                demandedTolerance = demandedTolerance * 2;
            end
        end
        initial_x = x;
        whichIterationAreWeOn = whichIterationAreWeOn + 1;
    end
end


function x = jacobiEquation(D, L, U, initial_x, Vector)
    x = - D \ ( L + U ) * initial_x + D \ Vector; % As per formula
    % We will be using D \ Vector and D \ ( ) instead of inverseD since
    % this is faster according to matlab
end