clear variable;
clear all;
clc;

% -------------------- a) case -------------------- %
    A = createMatrixB(100);
    b = createVectorB(100);

    x = Indicated_Method(A,b);
    
    % --- Second Holder Vector Norm for solution error --- %
%     r = A*x - b;
%     euclideanNormOfR = norm(r);
%     new_euclideanNormOfR = 0;
    
    % --- Residual correction --- %
    % --- Iterative Method --- %
    
%     r = A*x - b;
%     euclideanNormOfR = norm(r);
%     new_euclideanNormOfR = euclideanNormOfR;    
% 
%     while new_euclideanNormOfR <= euclideanNormOfR
%         
%         euclideanNormOfR = new_euclideanNormOfR;
%         r = A*x - b;
%         x = x - r;
%         new_euclideanNormOfR = norm(r);
%     end
    
    n = 10;

    while n <= 320 
        disp(n)
        A = createMatrixB(n);
        b = createVectorB(n);
        
        x = Indicated_Method(A,b);
        r = A*x - b;
        euclideanNormOfR = norm(r);
        
        hold on;
        plot(n, euclideanNormOfR, '.');
        hold off;
        
        n = n + 10;
        
    end
    
     xlabel('Iteration number');
     ylabel('Solution error');
     title('Task2b');
    
% % -------------------- Example -------------------- %
% %A = [3 1 6 ; 2 1 3 ; 1 1 1];
% %b = [2 ; 7 ; 4];
%  
% x_1 = A\b;
% x_2 = Indicated_Method(A,b);