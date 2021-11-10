% Function performs QR method of finding eigenvalues with shifts of matrix A
% N - the size of matrix A
% eigval - vector of eigenvalues
% iterCnt - number of iterations performed
function [eigval, iterCnt, finalA] = eigvalQRWithShift(A, N)
    iterCnt = 0;
    eigval = diag(A);
    
    initSubmatrix = A;
    for k = N:-1:2
        cp = initSubmatrix;
        
        while max(abs(cp(k, 1:k-1))) > 10^-6
            DD = cp(k-1:k, k-1:k);
            [ev1, ev2] = quadpolynroots(1, -(DD(1,1) + DD(2,2)), DD(2,2) * DD(1,1) - DD(2,1) * DD(1,2));
            
            if abs(ev1 - DD(2, 2)) < abs(ev2 - DD(2, 2))
                shift = ev1;
            else
                shift = ev2;
            end
            DP = cp - eye(k) * shift;
            [Q, R] = QRfactorization(DP, size(DP, 1));
            cp = R * Q + eye(k) * shift;
            iterCnt = iterCnt + 1;
        end
        eigval(k) = cp(k, k);
        A(1:k, 1:k) = cp(1:k, 1:k);
        if k > 2
            initSubmatrix = cp(1:k-1, 1:k-1);
        else
            eigval(1) = cp(1, 1);
        end
    end
    finalA = A; 
end