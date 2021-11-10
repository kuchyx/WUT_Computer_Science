function [A, b] = generateExamples(exampleNumber, size)
    height = 2 * size;
    width = size;
    A = zeros(height, width);
    b = zeros(height, 1);
    if exampleNumber == 1
        for i = 1:height
            for j = 1:width
                b(i) = 8 + 0.2 * i;
                if i == j
                    A(i, j) = 1/3;
                else
                    A(i,j) = 5 * (i - j) + 2;
                end
            end
        end
    elseif exampleNumber == 2
        for i = 1:height
            for j = 1:width
                b(i) = 2 + 2/(i + 1);
                A(i,j) = 1/(4* (i + j + 1));
            end
        end
    end
end

