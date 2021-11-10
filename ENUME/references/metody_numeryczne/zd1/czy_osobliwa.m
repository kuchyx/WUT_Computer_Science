A = [1 2 3 4;
    7 7 7 8;
    9 10 11 12;
    13 15 15 16];
n = 4;
M = zeros(n-1);
num = 0;

for k=1:n
    for i=2:n
        for j=1:n
            if j ~= k
                num = num + 1;
                M(i-1,num)=A(i,j);
            end;
        end;
        num = 0;
    end;
    disp(M);
    detM = M(1,1)*M(2,2)*M(3,3)+M(2,1)*M(3,2)*M(1,3)+M(3,1)*M(1,2)*M(2,3)-(M(3,1)*M(2,2)*M(1,3)+M(2,1)*M(1,2)*M(3,3)+M(1,1)*M(3,2)*M(2,3));
    %detMk(k)=detM;
    detA=detA + (-1)^(k+1)*A(1,k)*detM;
    disp(detM);
    disp(det(M));
end;
disp(detA);
