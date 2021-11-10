% close all windows and figures, clear command window
close all;
clear all;
clc;

%%%%%%%%%% ENUME %%%%%%%%%%
%%%%% PROJECT A NO.65% %%%%
% JAKUB TOMKIEWICZ 300183 %


%%%%%%%% PROBLEM 1 %%%%%%%%
 
% matlab generated epsilon

disp("PROBLEM 1");

% format long will give precise answer
format long;

% eps calculated by matlab 
matlab_auto_generated_eps = eps

% determining epsilon in calculation 
i = 1;
count = 0;

while 1+i > 1
    i = i/2;
    count = count + 1;
end

i = 2*i;

count = count - 1
manually_calculated_eps = i



%%%%%%%% PROBLEM 2 %%%%%%%%

disp("PROBLEM 2");

% format back to normal
format short;

% generate matrix for a)
[A_a,b_a] = generateMatrixForTaskA(10)

% solve a) using Gaussian elimination with partial pivoting
[x_a,normOfResiduum_a,normOfCorrectResiduum_a] = solveUsingGEWPP(A_a,b_a)

x_a_by_matlab = A_a\b_a

% generate matrix for b)
[A_b,b_b] = generateMatrixForTaskB(10)

% solve b) using Gaussian elimination with partial pivoting
[x_b,normOfResiduum_b,normOfCorrectResiduum_b] = solveUsingGEWPP(A_b,b_b)

x_b_by_matlab = A_b\b_b

% plot solution error versus n for a)
plotErrorForTaskA(8);

% plot solution error versus n for b)
plotErrorForTaskB(8);

condition_a=cond(A_a)

condition_b=cond(A_b)



%%%%%%%% PROBLEM 3 %%%%%%%%

disp("PROBLEM 3");

A_3 = [8 2 -3 1; 2 -25 5 -18; 1 3 15 -8; 1 1 -2 -10];
b_3 = [7; 12; 24; 28];

plotJacobiVsGaussSeidel(A_3,b_3)

% solve using matrix A and vector b from problem 2a
[x_from_2a_jacobi, ~, ~] = solveUsingJacobisMethod(A_a,b_a);
x_from_2a_jacobi

[x_from_2a_gs, ~, ~] = solveUsingGaussSeidelMethod(A_a,b_a);
x_from_2a_gs

% plotJacobiVsGaussSeidel(A_a,b_a)

% solve using matrix A and vector b from problem 2b
[x_from_2b_jacobi, ~, ~] = solveUsingJacobisMethod(A_b,b_b);
x_from_2b_jacobi

[x_from_2b_gs, ~, ~] = solveUsingGaussSeidelMethod(A_b,b_b);
x_from_2b_gs

% plotJacobiVsGaussSeidel(A_b,b_b)



%%%%%%%% PROBLEM 4 %%%%%%%%

disp("PROBLEM 4");

compareBothApproaches()



%%%%%%%% FUNCTIONS %%%%%%%%

% For problem 2 generating matrix for a) %
function [A,b] = generateMatrixForTaskA(n)

    % place for numbers, filled with zeros
    A = zeros(n);
    b = zeros(n,1);

    for i = 1:n
        for j = 1:n
            if(i == j)
                A(i,j) = 9;
            end
            if(i == j-1 || i == j+1)
                A(i,j) = 1;
            end
        end
    end

    for i = 1:n
        b(i) = 1.4 + 0.6*i;
    end
end

% For problem 2 generating matrix for b) %
function [A,b] = generateMatrixForTaskB(n)

    % place for numbers, filled with zeros
    A = zeros(n);
    b = zeros(n,1);

    for i = 1:n
        for j = 1:n
            A(i,j) = 3/(4*(i+j-1));
        end
    end

    for i = 1:n
        if(mod(i,2) == 1)
            b(i)=1/i;
        end
        if(mod(i,2) == 0)
            b(i)=0;
        end
    end
end

% For problem 2 solving linear equation using Gaussian elimination with partial pivoting %
function [C,normOfResiduum,normOfCorrectResiduum] = solveUsingGEWPP(A,b)

    n = size(A,1);

    % elimination phase 
    for k = 1:n

        % partial pivoting 
        for i = k+1:n
            if(A(k,k) < A(i,k))
                A([k i],:) = A([i k],:);
                b([k i]) = b([i k]);
            end
        end

        % conversion to upper-triangular matrix 
        for i = k+1:n
            rowMultiplier = A(i,k)/A(k,k);

            A(i,:) = A(i,:) - (rowMultiplier*A(k,:));

            b(i) = b(i)-(rowMultiplier*b(k));
        end
    end

    % back-substitution phase 
    C = zeros(1,n);

    for i = n:-1:1

        sum = 0;

        for j = i+1:n
            sum = sum + A(i,j)*C(j);
        end

        C(i) = (b(i)- sum)/A(i,i);
    end

    C = C';

    % residuum 
    residuum = A*C - b;

    % norm of residuum 
    normOfResiduum = norm(residuum);

    % residual correction Ad=r 
    residuum = residuum';
    d = residuum/A;

    goodX = C-d;
    CorrectResiduum = (A*goodX)-b;

    normOfCorrectResiduum = norm(CorrectResiduum);
end

% For problem 2 a) plotting graph %
function plotErrorForTaskA(numberOfEquations)

    n=10;

    % place for results, filled with 0s 
    RememberNormOfResiduum = zeros(numberOfEquations);
    RememberNormOfCorrectResiduum = zeros(numberOfEquations);
    RememberN = zeros(numberOfEquations);

    for i=1:numberOfEquations
        [A,b] = generateMatrixForTaskA(n);

        [~,normOfResiduum,normOfCorrectResiduum] = solveUsingGEWPP(A,b);

        RememberNormOfResiduum(i) = normOfResiduum;   
        RememberNormOfCorrectResiduum(i) = normOfCorrectResiduum;   
        RememberN(i) = n;

        % n = 10, 20, 40, 80, 160, ...
        n = n*2;
    end

    % graph %
    figure(1);
    plot(RememberN, RememberNormOfResiduum, '^b')
    hold on;
    plot(RememberN, RememberNormOfCorrectResiduum, '^r')
    hold off;
    
    title("For a) Number of equations versus solution error");
    xlabel("Number of equations (n)");
    ylabel("Solution error");

end

% For problem 2 b) plotting graph %
function plotErrorForTaskB(numberOfEquations)

    n=10;

    % place for results, filled with 0s  
    RememberNormOfResiduum = zeros(numberOfEquations);
    RememberNormOfCorrectResiduum = zeros(numberOfEquations);
    RememberN = zeros(numberOfEquations);

    for i=1:numberOfEquations
        [A,b] = generateMatrixForTaskB(n);

        [~,normOfResiduum,normOfCorrectResiduum] = solveUsingGEWPP(A,b);

        RememberNormOfResiduum(i) = normOfResiduum;   
        RememberNormOfCorrectResiduum(i) = normOfCorrectResiduum;   
        RememberN(i) = n;

        % n = 10, 20, 40, 80, 160, ...
        n = n*2;
    end

    % graph 
    figure(2);
    plot(RememberN, RememberNormOfResiduum, '^b')
    hold on;
    plot(RememberN, RememberNormOfCorrectResiduum, '^r')
    hold off;
    
    title("For b) Number of equations versus solution error");
    xlabel("Number of equations (n)");
    ylabel("Solution error");

end

% For problem 3 solve using Jacobis Method %
function [x, iterationNr, rememberError] = solveUsingJacobisMethod(A,b)

    x = zeros(size(A, 1), 1);
    
    % create L subdiagonal matrix
    L = tril(A,-1);
    
    % create D diagonal matrix
    D = diag(diag(A));
    
    % create U matrix with entries over diagonal
    U = triu(A,1);
    
    % tolerance
    assumedTolerance = 1e-10;
    
    % number of iterations
    nrOfIterations = 150;
    
    for i=1:nrOfIterations
        
        x = D \ (b + (-L-U)*x);
        
        % we cant preallocate iterationNr, we dont know how big will be
        iterationNr(i,1) = i;
        
        solutionErrorVector = norm(A*x - b); % checking norm of solution error value
        rememberError(i,1) = solutionErrorVector;
        
        if solutionErrorVector <= assumedTolerance % if test NOT saidsfied continue
            break;
        end
    end
end

% For problem 3 solve using Gauss-Seidel Method %
function [x, iterationNr, rememberError] = solveUsingGaussSeidelMethod(A,b)

    x = zeros(size(A, 1), 1);

    % create L subdiagonal matrix
    L = tril(A,-1);
    
    % creade D diagonal matrix
    D = diag(diag(A));
    
    % create U matrix with entries over diagonal
    U = triu(A,1);
    
    % tolerance
    assumedTolerance = 1e-10;
    
    % number of iterations
    nrOfIterations = 150;

    for i=1:nrOfIterations
        
        % create w
        w = U*x - b;
        
        for j=1:size(A, 1)
            
            % x = -w
            x(j) = -w(j);
            
            % -l*x
            for k=1:(j-1)
                 x(j) = -x(k)*L(j,k) + x(j);
            end
        	
            % /d
            x(j) = inv(D(j, j)) * x(j);
        end
        
        % we cant preallocate iterationNr, we dont know how big will be
        iterationNr(i,1) = i;
        
        solutionErrorVector = norm(A*x - b); % checking norm of solution error value
        rememberError(i,1) = solutionErrorVector;
        
        if solutionErrorVector <= assumedTolerance % if test NOT sadisfied continue
            break
        end
    end
    
end

% compare results of iterations, plot norm of solution error vs iteration nr %
function plotJacobiVsGaussSeidel(A,b)

    [~,iterationNrJacobi,rememberErrorJacobi] = solveUsingJacobisMethod(A,b);
    [~,iterationNrGaussSeidel,rememberErrorGaussSeidel] = solveUsingGaussSeidelMethod(A,b);
    
    % graph 
    figure(3);
    plot(iterationNrJacobi, rememberErrorJacobi, '-.r*')
    hold on;
    plot(iterationNrGaussSeidel, rememberErrorGaussSeidel, '--mo')
    hold off;
    
    title("Comparison between iteration number and solution error");
    xlabel("Number of iterations");
    ylabel("Solution error");
    legend("Jacobis method","Gauss-Seidel method");
end

% for problem 4 algorithm for the QR factorization %
function [Q,R] = qrmgs(A)

    [m n] = size(A);
    
    Q = zeros(m,n);
    R = zeros(n,n);
    d= zeros(1,n);
    
    % factorization with orthogonal/not orthogonoal columns of Q
    for i=1:n
        Q(:,i) = A(:,i);
        R(i,i) = 1;
        d(i) = Q(:,i)'*Q(:,i);
        
        for j=i+1:n
            R(i,j) = (Q(:,i)'*A(:,j))/d(i);
            A(:,j) = A(:,j)-R(i,j)*Q(:,i);
        end
    end
    
    % column normalization
    for i=1:n
        dd = norm(Q(:,i));
        Q(:,i) = Q(:,i)/dd;
        R(i,i:n) = R(i,i:n)*dd;
    end
end

% for problem 4 QR algorithm without shifts, calculate eigenvalues % 
function [eigenvalues, nrOfIterations] = EigvalQRNoShift(D, tol, imax)
    
    n = size(D,1);
    i = 1;
    D = hess(D); % hassenberg form
    
    while i <= imax & max(max(D-diag(diag(D)))) > tol
        [Q1, R1] = qrmgs(D);
        D = R1 * Q1; % transformed matrix
        i = i+1;
    end
    
    if i > imax
        disp('i exceed imax');
    end
    
    nrOfIterations = i;
    eigenvalues = diag(D);
end

% for problem 4 QR algorithm with shifts, calculate eigenvalues %
function [eigenvalues, nrOfIterations] = EigvalQRshifts(A, tol, imax)
    
    n = size(A,1);
    eigenvalues = diag(ones(n));
    A = hess(A); % hassenberg form
    
    INITIALsubmatrix = A; % initial matrix
    
    for k = n:-1:2
        DK = INITIALsubmatrix; % initial matrix to calculate
        
        i = 0;
        while i<=imax & max(abs(DK(k,1:k-1)))>tol
            DD = DK(k-1:k,k-1:k); % bottom 2x2 right corner submatrix
            [ev1, ev2] = quadpolynroots(1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2));
            
            if abs(ev1 - DD(2,2)) < abs(ev2 - DD(2,2))
                shift = ev1; % shift
            else
                shift = ev2;
            end
            
            DP = DK - eye(k)*shift; % shifted matrix
            [Q1, R1] = qrmgs(DP); % QR factorization
            DK = R1*Q1 + eye(k)*shift; % transformed matrix
            i = i+1;
        end
        
        if i > imax
            disp('imax exceeds program terminated');
        end
        
        nrOfIterations = i;
        
        eigenvalues(k) = DK(k,k);
        
        if k > 2
            INITIALsubmatrix = DK(1:k-1,1:k-1); % matrix deflation
        else
            eigenvalues(1) = DK(1,1); % last eigenvalue
        end
    end
end

% for problem 4 look for roots %
function [x0, x1] = quadpolynroots(a, b, c)

    delta1 = sqrt((b^2) - (4*a*c)) - b;
    delta2 = -sqrt((b^2) - (4*a*c)) - b;
    
    if abs(delta1) > abs(delta2)
        delta = delta1;
    else
        delta = delta2;
    end
    
    x0 = delta/(2*a);
    x1 = ((-b/a) - x0);
end

% for problem 4 compare both approaches and check results with matlab algorithm %
function compareBothApproaches()

    A = rand(5); % generate random 5x5 matrix
    A = A - tril(A, -1) + triu(A, 1)'; % taken from problem 3 functions
    
    [eigenvaluesNoShift, nrOfIterations_no_shift] = EigvalQRNoShift(A, 1e-6, 100); % nr of iterations 100, treshold 10e-6
    [eigenvaluesWithShift, nrOfIterations_with_shift] = EigvalQRshifts(A, 1e-6, 100); % nr of iterations 100, treshold 10e-6
    
    disp("Eigenvalues for QR method with no shift");
    disp(eigenvaluesNoShift);
    disp("Nr of iterations: " + nrOfIterations_no_shift);
    
    disp("Eigenvalues for QR method with shift");
    disp(eigenvaluesWithShift);
    disp("Nr of iterations: " + nrOfIterations_with_shift);
    
    % matlab build in function
    disp("As confirmation, eigenvalues calculated by MATLAB");
    disp(eig(A));
end