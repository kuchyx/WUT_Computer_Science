function [X] = oblicz(U, b, n)

    X(n) = b(n)/U(n,n);
    if (n <= 1)
        return;
    end
    X(n-1) = (b(n-1) - U(n-1,n)*X(n))/U(n-1,n-1);
    if (n <= 2)
        T = zeros(n,1);
        T(:) = X(:);
        X = T; 
        return;
    end
    UX = zeros(n,1);
    i = 2;
    k = n-i;
    while k >= 1
        UX(k) = UX(k) + U(k,:)*X(:);
        X(k) = (b(k)-UX(k))/U(k,k);
        i = i+1;
        k = n-i;
    end
    
    T = zeros(n,1);    
    T(:) = X(:);
    X = T;  
    
end