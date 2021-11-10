clear variable;
clear all;
clc;

 %A = [15, 2, -10, 1 ; 1, 11, 5, -3 ; 6, 1, -23, 15 ; 1, 2, -3, 9];
 %b = [13 ; 24 ; 8 ; 82];

%A = createMatrixA(10);
%b = createVectorA(10);

%A = createMatrixB(10);
%b = createVectorB(10);

[M,N] = size(A);

% ---Square matrix test---%
if M ~= N
    error ('A is not square matrix!');
end

% ---Diagonal dominance test---%
for m = 1:M 
    row = abs ( A(m,:) );
    d = sum(row) - row(m);
    
    
    
    if row(m) <= d
        %error ('A is not diagonally dominant!');
    end
end

D = diag(diag(A));

U = triu(A, 1);

L = tril(A, -1);

initial_x = zeros(M,1);
x = -inv(D+L) *((U)*initial_x - b);

iter_num = 0;
err_norm2 = inf; 

while err_norm2 >= 1e-10  %Assumed tolerance 
    x = -inv(D+L) *((U)*initial_x - b);
    initial_x = x;
    
    iter_num = iter_num + 1;
    err_norm2 = norm(abs(A*x-b)); 
    
    hold on;
    plot(iter_num, err_norm2, '.');
    hold off;

end

    xlabel('Iteration number');
    ylabel('Solution error');
    title('Gauss Seidel method');
