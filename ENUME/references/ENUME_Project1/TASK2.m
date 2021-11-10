classdef TASK2
    properties
        %main array size n by n
        A;
        %second array size n
        B;
        %answer
        x;
        %errors
        errors;
        %size of a matricx
        n;
    end
    methods (Access = 'protected')
        function [obj, locx] = gaussWithPartialPiv(obj)
            locx = zeros(obj.n, 1);
            for j = 1:obj.n
                %finding the maximal value of a column
                index = j;
                locMax = abs(obj.A(j, j));
                for i = j+1:obj.n
                    if abs(obj.A(i, j)) > locMax
                        locMax = abs(obj.A(i, j));
                        index = i;
                    end
                end
                %checking neccessary condition for the further execution
                if locMax == 0
                    disp(locMax);
                    disp('Wrong Matrix');
                    return
                end
                if index ~= j
                    %swaping the rows in neccessary (highest value found
                    %not in j row)
                    obj.A([index, j],:) = obj.A([j, index],:);
                    obj.B([index, j]) = obj.B([j, index]);
                end
                for i = j+1:obj.n
                    r = obj.A(i, j)/obj.A(j,j);
                    %if r == 0 we dont need to continue
                    if r ~= 0
                        %changing the main array A
                        for locj = j+1:obj.n
                            obj.A(i, locj) = obj.A(i, locj) - r*obj.A(j, locj);
                        end
                        %and the B array aswell
                        obj.B(i) = obj.B(i) - r*obj.B(j);
                    end
                end
            end
            %now finally we can obtain the results
            %Xn value is rather obvious
            locx(obj.n) = obj.B(obj.n)/obj.A(obj.n, obj.n);
            for i = obj.n-1:-1:1
                buffor = 0;
                for j = i+1:obj.n
                    buffor = buffor + obj.A(i, j)*locx(j);
                end
                locx(i) = (obj.B(i) - buffor)/obj.A(i,i);
            end
        end
        function obj = TaskAArray(obj)
            [row, columns] = size(obj.A);
            if row ~= size(obj.B)
                disp('A and B array size is different!');
                return 
            end
            for i = 1:row
                %setting the A array
                for j = 1:columns
                    if i == j
                        obj.A(i, j) = 13; 
                    elseif i == j-1 || i == j+1
                        obj.A(i, j) = 4;
                    else
                        obj.A(i, j) = 0;
                    end
                end
                %setting he B array
                obj.B(i) = 2.4 + 0.6*i;
            end
        end
        function obj = TaskBArray(obj)
            [row, columns] = size(obj.A);
            if row ~= size(obj.B)
                disp('A and B array size is differn!');
                return 
            end
            for i = 1:row
                %setting the A array
                for j = 1:columns
                    obj.A(i, j) = 4/(5*(i + j - 1));
                end
                %setting he B array
                if mod(i, 2) == 0
                    obj.B(i) = 1/(2*i);
                else
                    obj.B(i) = 0;
                end
            end
        end
        function obj = SetSize(obj, n)        
            obj.A = zeros(n);
            obj.B = zeros(n, 1);
            obj.x = zeros(n,1);
            obj.errors = zeros(n,1);
            obj.n = n;
        end
    end
    %public methods
    methods
        function obj = TASK2(n)
            obj.n = n;
        end
        function obj = GetErrors(obj)  
            %colculating the error following the formula r = Ax - b
            for i = 1:obj.n
                result = 0;
                for j = i:obj.n
                    result = result + obj.A(i,j) * obj.x(j);
                end
                obj.errors(i) = result - obj.B(i);
            end
        end
        function obj = ResidualCorrection(obj)
            newObj = TASK2(obj.n);
            newObj = obj;
            newObj.B = newObj.errors;
            [newObj, newObj.x] = gaussWithPartialPiv(newObj);
            for i = 1:obj.n
                obj.x(i) = obj.x(i) - newObj.x(i);
            end
        end
        function obj = TaskA(obj)
            obj = SetSize(obj, obj.n);
            obj = TaskAArray(obj);
            [obj, obj.x] = gaussWithPartialPiv(obj);
            obj = GetErrors(obj);
        end
        function obj = TaskB(obj)
            obj = SetSize(obj, obj.n);
            obj = TaskBArray(obj);
            [obj, obj.x] = gaussWithPartialPiv(obj);
            obj = GetErrors(obj);
        end
        function DispSolutionAndError(obj)
            format long
            disp('x for n ='); disp(obj.n);
            obj.x
            disp('errors for n ='); disp(obj.n);
            obj.errors
        end
         function DispObjects(obj)
            obj.A
            obj.B
            obj.x
            obj.errors
         end
    end
end