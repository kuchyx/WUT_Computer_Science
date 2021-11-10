function [A] = genA(SIZE,czySym)
        A = rand(SIZE);
        while rank(A)~= SIZE %powstanie macierzy o pelnym rzedzie
            A = rand(SIZE);
        end
        
        if czySym == 1
            A = A'+A; %dla symetrycznych
        end
end