classdef TASK4 < TASK2
    properties
        tol = 1e-6;
        imax = 10000;
    end
    methods
        function obj = TASK4()
            obj = obj@TASK2(5);
        end
        function [obj, Q, R]=QR(obj)
            Q=zeros(obj.n,obj.n);
            R=zeros(obj.n,obj.n);
            d=zeros(1,obj.n);
            for i=1:obj.n
                Q(:,i)=obj.A(:,i);
                R(i,i)=1;
                d(i)=Q(:,i)'*Q(:,i);
                for j=i+1:obj.n
                    R(i,j)=(Q(:,i)'*obj.A(:,j))/d(i);
                    obj.A(:,j)=obj.A(:,j)-R(i,j)*Q(:,i);
                end
            end
            for i=1:obj.n
                dd=norm(Q(:,i));
                Q(:,i)=Q(:,i)/dd;
                R(i,i:obj.n)=R(i,i:obj.n)*dd;
            end
        end
        function [obj, eig, i] = EigvalQRshifts(obj)
            obj.n=size(obj.A,1);
            eig=diag(ones(obj.n));
            INITIALsubmatrix=obj.A; 
            for k=obj.n:-1:2
                DK=INITIALsubmatrix;
                i=0;
                while i<=obj.imax && max(abs(DK(k,1:k-1)))>obj.tol
                    DD=DK(k-1:k,k-1:k);
                    [ev1,ev2]=roots(1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2));
                    if abs(ev1-DD(2,2)) < abs(ev2-DD(2,2))
                        shift=ev1;
                    else
                        shift=ev2;
                    end
                    DP=DK-eye(k)*shift;
                    [Q1,R1]=qr(DP);
                    DK=R1*Q1+eye(k)*shift;
                    i=i+1;
                end
                if i > obj.imax
                    error("Too many iterations!");
                end
                eig(k)=DK(k,k);
                if k > 2
                    INITIALsubmatrix=DK(1:k-1,1:k-1);
                else
                    eig(1)=DK(1,1);
                end
                DK
            end
        end
        function [obj, eigenvalues, i] = EigvalQRNoShift(obj)
            i=1;
            while i <= obj.imax && max(max(obj.A-diag(diag(obj.A)))) > obj.tol
                [obj, Q1,R1] = QR(obj);
                obj.A=R1*Q1;
                i=i+1;
            end
            if i > obj.imax
                error("Too many iterations!");
            end
            eigenvalues=diag(obj.A);
        end
        function obj = SetExampleShifts(obj)
            obj = SetSize(obj, 5);
            obj.A = [2 33 8 -3 4; 33 1 -6 5 -3; 8 -6 -5 -6 8; -3 5 -6 3 2; 4 -3 8 2 45];
            [obj, eig, k] = EigvalQRshifts(obj);
            eig
            k
        end
        function obj = SetExample(obj)
            obj = SetSize(obj, 5);
            obj.A = [2 33 8 -3 4; 33 1 -6 5 -3; 8 -6 -5 -6 8; -3 5 -6 3 2; 4 -3 8 2 45];
            [obj, eig, k] = EigvalQRNoShift(obj);
            eig
            k
        end
    end
end
function [x1, x2] = roots(a, b, c)
    first = -b + sqrt(b * b - 4 * a * c);
	second = -b - sqrt(b * b - 4 * a * c);
	li = max(abs(first), abs(second));
	x1 = li/(2*a);
	x2 = ((-b)/a);
end