function[bool] = warDost(A,n)
    for i = 1:n
        %Sumujemy wszystkie elementy w wierszu oprócz g³ównej przek¹tnej
        sum = 0;
        for j = 1:n
            if i~=j
                sum = sum + abs(A(i,j));
            end
        end
        %Sprawdzamy warunek silnej dominancji dla jednego wiersza 
        if sum > abs(A(i,i))
            bool = 0;
            return;
        end
    end
    bool = 1;
end