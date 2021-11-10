function epsi = zd1
    a = 1/2;
    c = 1 + a;
    t = 1;
    
    %zliczamy liczbe znaków mantysy na danym komputerze 
    %œledzimy kiedy z powodu niewystarczaj¹cej liczby mantysy "c" bêdzie równa 1
    while c ~= 1 
        t = t + 1;
        a = a / 2;
        c = 1 + a;
    end

    epsi = 2^(-t+1);
    disp(t);
end
