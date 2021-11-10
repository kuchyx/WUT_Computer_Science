% Function performs QR method of finding eigenvalues without shifts of matrix A
% N - the size of matrix A
% eigval - vector of eigenvalues
% iterCnt - number of iterations performed
% finalMat - matrix A after procedure 
function [eigval, iterCnt, finalMat] = eigvalQRNoShift(A, N)
    iterCnt = 0;
    while max(max(A-diag(diag(A)))) > 10^-6
        
        [Q, R] = QRfactorization(A, N);
        A = R * Q;
        iterCnt = iterCnt + 1;
        
    end
    eigval = diag(A);
    
    finalMat = A;
end
