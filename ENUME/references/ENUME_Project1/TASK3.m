classdef TASK3 < TASK2
    properties
        acc = 1e-10;
    end
    methods (Access = 'private')
        function [obj, array]= gaussSeidel(obj, type)
            array = [];
            err = inf;
            k = 1;
            m = 10000;
            while  k <= m && err > obj.acc
                localMax = 0;
                for i = 1 : obj.n 
                    s = 0;
                    for j = 1 : obj.n 
                        s = s+(-obj.A(i,j)*obj.x(j));
                    end
                    s = (s+obj.B(i))/obj.A(i,i);
                    if abs(s) > localMax 
                        localMax  = abs(s);
                    end
                    obj.x(i) = obj.x(i) + s;
                end
                if err > localMax
                    err = localMax ;
                end
                k = k+1;
                obj = GetErrors(obj);
                if(type == 'N')%norm
                    array(end+1) = norm(obj.errors);
                elseif(type == 'E')%maximal value of s
                    array(end+1) = localMax;
                end
            end
            disp(k - 1);
        end
        function [obj, array]= jacobi(obj, type)
            array = [];
            err = inf;
            k = 1;
            m = 10000;
            x1 = zeros(obj.n, 1);
            while  k <= m && err > obj.acc
                localMax = 0;
                for i = 1 : obj.n 
                    s = 0;
                    for j = 1 : obj.n 
                        s = s+(-obj.A(i,j)*x1(j));
                    end
                    x1 = obj.x;
                    s = (s+obj.B(i))/obj.A(i,i);
                    obj.x(i) = obj.x(i) + s;
                    if abs(s) > localMax 
                        localMax  = abs(s);
                    end
                end
                if err > localMax
                    err = localMax ;
                end
                k = k+1;
                obj = GetErrors(obj);
                if(type == 'N')%norm
                    array(end+1) = norm(obj.errors);
                elseif(type == 'E')%maximal value of s
                    array(end+1) = localMax;
                end
            end
            disp(k - 1);
        end
	end
    methods
        function obj = TASK3()
            obj = obj@TASK2(4);
        end
        function obj = SetTask3(obj)
            obj = SetSize(obj, 4);
            obj.A = [13 2 -8 1; 1 10 5 -2; 6 2 -23 15; 1 22 -1 13];
            obj.B = [16 24 184 82];
        end
        function obj = Example(obj)
            obj = SetSize(obj, 4);
            obj.A = [5 -2 3 0; -3 9 1 -2; 2 -1 -7 1; 4 3 -5 7];
            obj.B = [-1 2 3 0.5];
            [obj, array] = gaussSeidel(obj, 'N');
            plot(array, '-o');
        end
        %type in 'G' for Gauss Seidel and 'J' for Jacobi method.
        function obj = Task3System(obj, alg)
            obj = SetSize(obj, 4);
            obj.A = [13 2 -8 1; 1 10 5 -2; 6 2 -23 15; 1 22 -1 13];
            obj.B = [16 24 184 82];
            if alg == 'G'
                [obj, array] = gaussSeidel(obj);
                plot(array, '-o');
            elseif alg == 'J'
                [obj, array] = jacobi(obj);
                plot(array, '-or');
            end
        end
        function obj = Task3a(obj, type)
            if type ~= 'N' && type ~= 'E'
                disp('Wrong type parameter!');
                return
            end
            obj = SetTask3(obj);
            [obj, array1] = gaussSeidel(obj, type);
            obj = SetTask3(obj);
            [obj, array2] = jacobi(obj, type);
            plot(array1, 'ob-');
            hold on
            plot(array2, 'or-');
            hold off
        end
        function obj = Task3With2a(obj, input, type)
            obj = SetSize(obj, 10);
            obj = TaskAArray(obj);
            if input == 'G'
                [obj, table] = gaussSeidel(obj, type);
                plot(table, '-o');
            elseif input == 'J'
                [obj, table] = jacobi(obj,type);
                plot(table, '-o');
            elseif input == 'B'
                [obj, table] = gaussSeidel(obj,type);
                obj = SetSize(obj, 10);
                obj = TaskAArray(obj);
                [obj, table2] = jacobi(obj,type);
                plot(table, '-o');
                hold on
                plot(table2, '-or');
                hold off
            end
        end
        function obj = Task3With2b(obj, input, type)
            obj = SetSize(obj, 10);
            obj = TaskBArray(obj);
            if input == 'G'
                [obj, table] = gaussSeidel(obj, type);
                plot(table, '-o');
            elseif input == 'J'
                [obj, table] = jacobi(obj,type);
                plot(table, '-o');
            elseif input == 'B'
                [obj, table] = gaussSeidel(obj,type);
                obj = SetSize(obj, 10);
                obj = TaskBArray(obj);
                [obj, table2] = jacobi(obj,type);
                plot(table, '-o');
                hold on
                plot(table2, '-o');
                hold off
            end
        end
    end
end