function [eigenvalues,iteration,Afinal] = eigenvalueQRshift(A)
%EIGENVALUEQRSHIFT calculates eigenvalues using the QR method with shifts
%   returns eigenvalues, the number of iterations and the transformed
%   matrix A
n = size(A, 1);
eigenvalues = diag(ones(n));
    
initialSub = A;
iteration = 0;
    for k = n:-1:2
        DK = initialSub;
        
        while max(abs(DK(k, 1:k-1))) > 10^-6
            DD = DK(k-1:k, k-1:k);
            [ev1, ev2] = quadpolynroots(1, -(DD(1,1) + DD(2,2)), DD(2,2) * DD(1,1) - DD(2,1) * DD(1,2));
            
            if abs(ev1 - DD(2, 2)) < abs(ev2 - DD(2, 2))
                shift = ev1;
            else
                shift = ev2;
            end
            DP = DK - eye(k) * shift;
            [Q, R] = QRfactorize(DP);
            DK = R * Q + eye(k) * shift;
            iteration = iteration + 1;
        end
        eigenvalues(k) = DK(k, k);
        A(1:k, 1:k) = DK(1:k, 1:k);
        if k > 2
            initialSub = DK(1:k-1, 1:k-1);
        else
            eigenvalues(1) = DK(1, 1);
        end
    end
    Afinal = A; 
end

