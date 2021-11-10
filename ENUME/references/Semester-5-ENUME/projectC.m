% close all windows and figures, clear command window
close all;
clear all;
clc;

%%%%%%%%%% ENUME %%%%%%%%%%
%%%%% PROJECT C NO.61 %%%%%
% JAKUB TOMKIEWICZ 300183 %

%%%%%%%% PROBLEM 1 %%%%%%%%

% data
x = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
y = [-36.4986, -20.1300, -10.4370, -3.8635, -1.3503, 0.8879, 0.8176, 1.4830, 4.4024, 10.3910, 21.3003];

% plot graphs of polynomials
solveAndCreateFigure(x,y,2);
solveAndCreateFigure(x,y,4);
solveAndCreateFigure(x,y,6);
solveAndCreateFigure(x,y,8);
solveAndCreateFigure(x,y,10);

% show errors and condition nr for all
showDataForAllDegrees(x,y);

%%%%%%%% PROBLEM 2 %%%%%%%%

%%%%%% PART A %%%%%%

% Solution curves %

plotSolutionCurves(1,1); % optimal RK4
plotSolutionCurves(1,0); % optimal P5EC5E

plotSolutionCurves(0,1); % larger RK4
plotSolutionCurves(0,0); % larger P5EC5E

plotOptimalVsLarger(1); % RK4
plotOptimalVsLarger(0); % P5EC5E

% Solution versus time %

%RK4
plotSolutionTime(1,1); % x1
plotSolutionTime(1,0); % x2

%P5EC5E
plotSolutionTime(0,1); % x1
plotSolutionTime(0,0); % x2

%%%%%% PART B %%%%%%

[x1,x2,t,h,error1,error2] = RK4autoAdjust(0.0001,0,20,1e-9,1e-9);

figure(1);
plot(x1,x2);
title("x1 vs x2");

figure(2);
plot(t,h);
title("Step size vs time");

figure(3);
plot(t,error1);
title("error for x1 vs time");

figure(4);
plot(t,error2);
title("error for x2 vs time");

figure(5);
hold on;
plot(t,x1);
plot(t,x2);
hold off;
title("problem solution vs time");
legend("x1","x2",'Location','southoutside');

%%%%%%%% FUNCTIONS %%%%%%%%

% PROBLEM 1 algorithm for the QR factorization, same as in Project A
function [Q,R] = qrmgs(A)

    [m n] = size(A);
    
    Q = zeros(m,n);
    R = zeros(n,n);
    d = zeros(1,n);
    
    % factorization with orthogonal/not orthogonoal columns of Q
    for i=1:n
        Q(:,i) = A(:,i);
        R(i,i) = 1;
        d(i) = Q(:,i)'*Q(:,i);
        
        for j=i+1:n
            R(i,j) = (Q(:,i)'*A(:,j))/d(i);
            A(:,j) = A(:,j)-R(i,j)*Q(:,i);
        end
    end
    
    % column normalization
    for i=1:n
        dd = norm(Q(:,i));
        Q(:,i) = Q(:,i)/dd;
        R(i,i:n) = R(i,i:n)*dd;
    end
end

% PROBLEM 1 create matrix known as Grams matrix
function [A,b] = createGramsMatrix(x,y,degree)

    degree = degree+1;

    % matrix A and vector b filled with zeros
    A = zeros(degree, degree);
    b = zeros(degree, 1);
    
    n = length(x);
    
    % i and j cant start from 0 as array indices has to be positive
    
    % matrix A
    for i=1:degree
        for j=1:degree
            for k=1:n % sum
                A(i,j) = A(i, j) + (x(1, k)^(i+j-1-1)); % auxiliary definition
            end
        end
    end
    
    % vector b
    for i=1:degree
        for k=1:n % sum
            b(i, 1) = b(i, 1) + (y(k)*(x(k)^(i-1))); % auxiliary definition
        end
    end
end

% PROBLEM 1 solve equations, most code taken from Project A
function [error, conditionNr, C] = solveEquation(A,b)
    
    [Q, R] = qrmgs(A); % qr factorization
    
    n = size(A,1);
    C = zeros(n,1);
    
    % connect matrix with vector
    D = Q' * b;
    
    % starting from end until 1
    for i=n:-1:1 % back-substitution phase 
        C(i) = D(i)/R(i,i);
        D(1:i-1) = D(1:i-1) - (C(i)*R(1:i-1,i));
    end
    
    % residuum 
    residuum = A*C - b;

    % norm of residuum 
    error = norm(residuum);

    % conditionNr
    conditionNr = cond(A);
end

% PROBLEM 1 solve equation and print figure
function solveAndCreateFigure(x,y,degree)
    
    % create Gram's matrix and solve equation
    [A,b] = createGramsMatrix(x,y,degree);
    
    % we need only C
    [~,~,C] = solveEquation(A,b);
    
    disp(C);
    %C2 = A\b; % make sure if answer is same as buildin function
    %disp(C2);
    
    % plot x y on graph
    figure(degree);
    plot(x,y, 'r*');
    hold on;
    
    % functions various from degree
    if(degree == 2) 
        f = @(x)C(3)*x^2 + C(2)*x + C(1);
    end
    
    if(degree == 4)
        f = @(x)C(5)*x^4 + C(4)*x^3 + C(3)*x^2 + C(2)*x + C(1);
    end
    
    if(degree == 6)
        f = @(x)C(7)*x^6 + C(6)*x^5 + C(5)*x^4 + C(4)*x^3 + C(3)*x^2 + C(2)*x + C(1);
    end
    
    if(degree == 8)
        f = @(x)C(9)*x^8 + C(8)*x^7 + C(7)*x^6 + C(6)*x^5 + C(5)*x^4 + C(4)*x^3 + C(3)*x^2 + C(2)*x + C(1);
    end
    
    if(degree == 10)
        f = @(x)C(11)*x^10 + C(10)*x^9 + C(9)*x^8 + C(8)*x^7 + C(7)*x^6 + C(6)*x^5 + C(5)*x^4 + C(4)*x^3 + C(3)*x^2 + C(2)*x + C(1);
    end

    % plotting function
    fplot(f,[-5 5],'k'); % from -5 to 5
    grid on;
    hold off;
    title("Polynomial of degree " + degree);
    % put legend in less conflict area
    legend("Samples","Polynomial",'Location','Best');
    
end

% PROBLEM 1 show error and condition nr for all degrees
function showDataForAllDegrees(x,y)
    
    % from degree 1 to degree 10
    for degree=1:1:10
        % create
        [A,b] = createGramsMatrix(x,y,degree);
        %disp(A);
        %disp(b);
        % solve
        [error,conditionNr,~] = solveEquation(A,b);
        disp("Degree "+ degree + " Error " + error + " ConditionNr " + conditionNr);
    end
    
end

% PROBLEM 2 calculate Runge Kutta 4th order
function [y1,y2,x] = RK4(h, beginning, ending)

    x = beginning:h:ending;
    
    % prelocate with zeros
    y1 = zeros(1,length(x)); 
    y2 = zeros(1,length(x)); 

    % initial conditions
    y1(1) = -0.4;
    y2(1) = -0.3;
    
    % motion of a point
    f_1 = @(t, x1, x2) x2 + x1*(0.5 - x1^2 - x2^2);
    f_2 = @(t, x1, x2) -x1 + x2*(0.5 - x1^2 - x2^2);

    % loop
    for i=1:(length(x)-1)
        %k1
        k1_1 = f_1( x(i), y1(i), y2(i) );
        k1_2 = f_2( x(i), y1(i), y2(i) );
        
        %k2
        k2_1 = f_1( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k1_1 );
        k2_2 = f_2( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k1_2 );
        
        %k3
        k3_1 = f_1( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k2_1 );
        k3_2 = f_2( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k2_2 );
        
        %k4
        k4_1 = f_1( x(i)+h, y1(i)+h, y2(i) + h*k3_1 );
        k4_2 = f_2( x(i)+h, y1(i)+h, y2(i) + h*k3_2 );
        
        %y_(n+1)
        y1(i+1) = y1(i) + (1/6)*(k1_1 + 2*k2_1 + 2*k3_1 + k4_1)*h;      
        y2(i+1) = y2(i) + (1/6)*(k1_2 + 2*k2_2 + 2*k3_2 + k4_2)*h;
    end
end

% PROBLEM 2 calculate Adams method P5EC5E
function [y1,y2,x] = P5EC5E(h, beginning, ending)

    %P5EC5E method so k=5
    k = 5;
    
    % values taken from book, page 177
    betaExplicit = [1901/720, -2774/720, 2616/720, -1274/720, 251/720];
    betaImplicit = [475/1440, 1427/1440, -789/1440, 482/1440, -173/1440, 27/1440];
    
    % motion of a point
    f_1 = @(t, x1, x2) x2 + x1*(0.5 - x1^2 - x2^2);
    f_2 = @(t, x1, x2) -x1 + x2*(0.5 - x1^2 - x2^2);
    
    % perform RK4 for first 5 iterations
    [y1,y2,x] = RK4(h, beginning, (k*h)-beginning);
    
    % start the loop from 6th iteration and do untill rounded integer value
    % of (end of interval-begin of interval)/(step size)
    for i=(k+1):(ceil(ending-beginning)/h)
        
        % at each iteraion x is bigger for h value
        x(i+1) = x(i) + h;
        
        %calculate sum of beta and function in order to have P
        sumP_1 = 0;
        sumP_2 = 0;
        for j=1:k
            sumP_1 = sumP_1 + betaExplicit(j)*f_1( x(i-j), y1(i-j), y2(i-j) );
            sumP_2 = sumP_2 + betaExplicit(j)*f_2( x(i-j), y1(i-j), y2(i-j) );
        end
        
        %P prediction
        y1(i+1) = y1(i) + h*sumP_1;
        y2(i+1) = y2(i) + h*sumP_2;
        
        %E evaluation
        f1 = f_1( x(i), y1(i+1), y2(i+1) );
        f2 = f_2( x(i), y1(i+1), y2(i+1) );
        
        %calculate sum of beta and function in order to have C
        sumC_1 = 0;
        sumC_2 = 0;
        for j=1:k
            sumC_1 = sumC_1 + betaImplicit(j)*f_1( x(i-j), y1(i-j), y2(i-j) );
            sumC_2 = sumC_2 + betaImplicit(j)*f_2( x(i-j), y1(i-j), y2(i-j) );
        end
        
        %C correction
        y1(i+1) = y1(i) + h*sumC_1 + h*betaImplicit(1)*f1;
        y2(i+1) = y2(i) + h*sumC_2 + h*betaImplicit(1)*f2;
        
        %E evaluation
        f1 = f_1( x(i), y1(i+1), y2(i+1) );
        f2 = f_2( x(i), y1(i+1), y2(i+1) );
    end
end

% PROBLEM 2 plot solution curves
function plotSolutionCurves(optimal,rk4)
    if(optimal == 1) % optimal step size
        if(rk4 == 1) % use RK4
            [x1,x2] = RK4(0.004,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [~,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(11);
            hold on;

            plot(x1,x2);
            plot(y_ode45(:,1),y_ode45(:,2));
            legend("RK4","ODE45",'Location','Best');
            title("RK4 vs ODE45 optimal step-size");
            hold off;
        else % use P5EC5E
            [x1,x2] = P5EC5E(0.001,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [~,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(12);
            hold on;
            
            plot(x1,x2);
            plot(y_ode45(:,1),y_ode45(:,2));
            legend("P5EC5E","ODE45",'Location','Best');
            title("P5EC5E vs ODE45 optimal step-size");
            hold off;
        end
    else % larger step size
        if(rk4 == 1) % use RK4
            [x1,x2] = RK4(0.04,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [~,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(13);
            hold on;

            plot(x1,x2);
            plot(y_ode45(:,1),y_ode45(:,2));
            legend("RK4","ODE45",'Location','Best');
            title("RK4 vs ODE45 larger step-size");
            hold off;
        else % use P5EC5E
            [x1,x2] = P5EC5E(0.03,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [~,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(14);
            hold on;
            
            plot(x1,x2);
            plot(y_ode45(:,1),y_ode45(:,2));
            legend("P5EC5E","ODE45",'Location','Best');
            title("P5EC5E vs ODE45 larger step-size");
            hold off;
        end
    end
end

% PROBLEM 2 plot solutions vs time
function plotSolutionTime(rk4,x1)
    if(rk4 == 1) % use RK4
        if(x1 == 1) % for x1
            [x1,~,t1] = RK4(0.004,0,20);

            [x1_2,~,t1_2] = RK4(0.04,0,20);

            % ode45( functions, interval, initial_conditions )
            [t_ode45,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function

            figure(15);
            hold on;

            plot(t1,x1);
            plot(t1_2,x1_2);
            plot(t_ode45,y_ode45(:,1));
            legend("optimal step-size","larger step-size","ODE45",'Location','southoutside');
            title("RK4 x1 solutions vs time");
            xlabel("t");
            ylabel("x1");
            hold off;
        else % for x2
            [~,x2,t1] = RK4(0.004,0,20);

            [~,x2_2,t1_2] = RK4(0.04,0,20);

            % ode45( functions, interval, initial_conditions )
            [t_ode45,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function

            figure(16);
            hold on;

            plot(t1,x2);
            plot(t1_2,x2_2);
            plot(t_ode45,y_ode45(:,2));
            legend("optimal step-size","larger step-size","ODE45",'Location','southoutside');
            title("RK4 x2 solutions vs time");
            xlabel("t");
            ylabel("x2");
            hold off;
        end
    else % use P5EC5E
        if(x1 == 1) % for x1
            [x1,~,t1] = P5EC5E(0.001,0,20);
            
            [x1_2,~,t1_2] = P5EC5E(0.03,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [t_ode45,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(17);
            hold on;
            
            plot(t1,x1);
            plot(t1_2,x1_2);
            plot(t_ode45,y_ode45(:,1));
            xlim([0 20]);
            legend("optimal step-size","larger step-size","ODE45",'Location','southoutside');
            title("P5EC5E x1 solutions vs time");
            xlabel("t");
            ylabel("x1");
            hold off;
        else % for x2
            [~,x2,t1] = P5EC5E(0.001,0,20);
            
            [~,x2_2,t1_2] = P5EC5E(0.03,0,20);
            
            % ode45( functions, interval, initial_conditions )
            [t_ode45,y_ode45] = ode45(@(t,x) [x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2)], [0,20], [-0.4,-0.3]);
            % t is a time vector, y is a vector solutions of a function
            
            figure(18);
            hold on;
            
            plot(t1,x2);
            plot(t1_2,x2_2);
            plot(t_ode45,y_ode45(:,2));
            xlim([0 20]);
            legend("optimal step-size","larger step-size","ODE45",'Location','southoutside');
            title("P5EC5E x2 solutions vs time");
            xlabel("t");
            ylabel("x2");
            hold off;
        end
    end
end

% PROBLEM 2 plot optimal vs larger step-size
function plotOptimalVsLarger(rk4)
    if(rk4 == 1) % RK4
        [x1,x2] = RK4(0.004,0,20); % optimal
        [x1_2,x2_2] = RK4(0.04,0,20); % larger
            
        figure(19);
        hold on;

        plot(x1,x2);
        plot(x1_2,x2_2);
        legend("optimal step-size","larger step-size",'Location','Best');
        title("RK4 optimal vs larger step-size");
        hold off;
    else % P5EC5E
        [x1,x2] = P5EC5E(0.001,0,20); % optimal
        [x1_2,x2_2] = P5EC5E(0.03,0,20); % larger

        figure(20);
        hold on;

        plot(x1,x2);
        plot(x1_2,x2_2);
        legend("optimal step-size","larger step-size",'Location','Best');
        title("P5EC5E optimal vs larger step-size");
        hold off;
    end
end

% PROBLEM 2 RK4 with adjustable initial variables for RK4autoAdjust 
function [root1,root2,x] = RK4withInitialValues(h, beginning, ending, initial1, initial2)

    x = beginning:h:ending;
    
    % dont prealocate with zeros here

    % initial conditions
    y1(1) = initial1;
    y2(1) = initial2;
    
    % motion of a point
    f_1 = @(t, x1, x2) x2 + x1*(0.5 - x1^2 - x2^2);
    f_2 = @(t, x1, x2) -x1 + x2*(0.5 - x1^2 - x2^2);

    maxi = 1;
    % loop
    for i=1:(length(x)-1)
        %k1
        k1_1 = f_1( x(i), y1(i), y2(i) );
        k1_2 = f_2( x(i), y1(i), y2(i) );
        
        %k2
        k2_1 = f_1( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k1_1 );
        k2_2 = f_2( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k1_2 );
        
        %k3
        k3_1 = f_1( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k2_1 );
        k3_2 = f_2( x(i)+0.5*h, y1(i)+0.5*h, y2(i)+0.5*h*k2_2 );
        
        %k4
        k4_1 = f_1( x(i)+h, y1(i)+h, y2(i) + h*k3_1 );
        k4_2 = f_2( x(i)+h, y1(i)+h, y2(i) + h*k3_2 );
        
        %y_(n+1)
        y1(i+1) = y1(i) + (1/6)*(k1_1 + 2*k2_1 + 2*k3_1 + k4_1)*h;      
        y2(i+1) = y2(i) + (1/6)*(k1_2 + 2*k2_2 + 2*k3_2 + k4_2)*h;
        
        % maxi needed for the last element
        maxi = i+1;
    end
    
    % only the last element
    root1 = y1(maxi);
    root2 = y2(maxi);
end

% PROBLEM 2 calculate RK4 with automatic step-size adjustement
function [y1,y2,x,auto_h,error_1,error_2] = RK4autoAdjust(h,beginning,ending,epsr,epsa)
    
    % store different values of h
    auto_h(1) = h;
    
    % this time whole x cannot be defined at this point
    x(1) = beginning;
    
    % initial conditions
    y1(1) = -0.4;
    y2(1) = -0.3;
    
    % 2^p and order p=4 so 2^4=16
    
    % places for errors
    error_1(1) = 0;
    error_2(1) = 0;
    
    for i=1:100000 % more than enought, answer is achieved at 56756 iterations
               
        % after single step
        [y1_single,y2_single,time_single] = RK4withInitialValues(auto_h(i),x(i),auto_h(i)+x(i),y1(i),y2(i));
        
    
        % after double step
        [y1_double,y2_double,time_double] = RK4withInitialValues(auto_h(i)*0.5,x(i),auto_h(i)+x(i),y1(i),y2(i));
       
        
        % 7.22 from page 169
        y1(i+1) = y1_single + (16/15)*(y1_double-y1_single); %x1
        y2(i+1) = y2_single + (16/15)*(y2_double-y2_single); %x2
        
        % error estimate for a double step (for RK)
        delta_y1_double = ((y1_double - y1_single)/15);
        error_1(i+1)= delta_y1_double; % store error
        delta_y2_double = ((y2_double - y2_single)/15);
        error_2(i+1)= delta_y2_double; % store error
        
        % accuracy parameters
        eps1 = (abs(y1(i))*epsr)+epsa; %epsr=relative tolerance, epsa=absolute tolerance
        eps2 = (abs(y2(i))*epsr)+epsa;
        
        % step-size correction
        alpha_1 = (eps1/abs(delta_y1_double))^(1/5); % 7.33 page 173
        alpha_2 = (eps2/abs(delta_y2_double))^(1/5);
        
        % we need to take worst case scenerio, so only smallest alpha needs
        % to be taken into accound (smallest alpha with the biggest
        % denominator)
        if(alpha_1 < alpha_2)
            smallest_alpha = alpha_1;
        else
            smallest_alpha = alpha_2;
        end
        
        % with the use of safety factor s=0.9
        auto_h(i+1) = 0.9*smallest_alpha*auto_h(i);
        
        x(i+1)=x(i);
        
        % from the block diagram on page 174
        if(0.9*smallest_alpha >=1) %s*alpha
            if(x(i)+auto_h(i)>=ending) % meets b or after b
                break;
            else
                x(i+1) = x(i) + auto_h(i);
                % beta=5 taken from book, page 174
                minimum_temp = min(5*auto_h(i),auto_h(i+1));
                auto_h(i+1) = min(minimum_temp,ending-x(i));
            end
        else
            if(auto_h(i+1) < eps) % eps as h_min
                disp("Error: No solution for assumed accuracy")
                break;
            end
        end
    end
end