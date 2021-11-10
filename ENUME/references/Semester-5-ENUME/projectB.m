% close all windows and figures, clear command window
close all;
clear all;
clc;

%%%%%%%%%% ENUME %%%%%%%%%%
%%%%% PROJECT B NO.61 %%%%%
% JAKUB TOMKIEWICZ 300183 %

%%%%%%%% PROBLEM 1 %%%%%%%%
f = @(x)0.3*x*sin(x)-log(x-1); % my function

% interval [2 12] divided into 3 parts
[iter_Sacant1, root_Sacant1] = SecantMethod(f,50,1e-9,2,6,1); % [2 6]
[iter_Sacant2, root_Sacant2] = SecantMethod(f,50,1e-9,6.1,8,2); % [6 8]
[iter_Sacant3, root_Sacant3] = SecantMethod(f,50,1e-9,8.1,12,3); % [8 12]

hold on;
fplot(f,[2 12],'k'); % plot function in interval
title("f(x)=0.3*x*sin(x)-ln(x-1) Secant method");
hold off;

% print nr of iterations and root
iter_Sacant1
root_Sacant1

iter_Sacant2
root_Sacant2

iter_Sacant3
root_Sacant3

figure(2);
% interval [2 12] divided into 3 parts
[iter_Newton1, root_Newton1] = NewtonsMethod(f,50,1e-9,2,6,1,1); % [2 6] 
[iter_Newton2, root_Newton2] = NewtonsMethod(f,50,1e-9,6.1,8,2,1); % [6 8]
[iter_Newton3, root_Newton3] = NewtonsMethod(f,50,1e-9,8.1,12,3,1); % [8 12] 

hold on;
fplot(f,[2 12],'k'); % plot function in interval
title("f(x)=0.3*x*sin(x)-ln(x-1) Newtons method");
hold off;

% print nr of iterations and root
iter_Newton1
root_Newton1

iter_Newton2
root_Newton2

iter_Newton3
root_Newton3


%%%%%%%% PROBLEM 2 %%%%%%%%
f = @(x)2*x^4 + 3*x^3 + (-6)*x^2 + 4*x + 7;
p = [2 3 -6 4 7];

% MM1 method
figure(1);
hold on;
grid on;
fplot(f,[-5 4],'k');

% first root
x0 = -2;
x1 = -2.5;
x2 = -3;
[nrIterationsMM1_1, rootMM1_1] = MM1method(p, x0, x1, x2,50,1e-9);
plot(rootMM1_1,f(rootMM1_1), 'r*');
plot(x0,f(x0),'bs');
plot(x1,f(x1),'bs');
plot(x2,f(x2),'bs');

% second root
x0 = 0;
x1 = -0.5;
x2 = -1;
[nrIterationsMM1_2, rootMM1_2] = MM1method(p, x0, x1, x2,50,1e-9);
plot(rootMM1_2,f(rootMM1_2), 'r*');
plot(x0,f(x0),'bs');
plot(x1,f(x1),'bs');
plot(x2,f(x2),'bs');

% third root
x0 = 0.5;
x1 = 1-0.25i;
x2 = 1.5;
[nrIterationsMM1_3, rootMM1_3] = MM1method(p, x0, x1, x2,50,1e-9);
plot(rootMM1_3,f(rootMM1_3), 'r*');
plot(x0,f(x0),'bs');
plot(x1,f(x1),'bs');
plot(x2,f(x2),'bs');

% fourth root
x0 = 0.5;
x1 = 1+0.25i;
x2 = 1.5;
[nrIterationsMM1_4, rootMM1_4] = MM1method(p, x0, x1, x2,50,1e-9);
plot(rootMM1_4,f(rootMM1_4), 'r*');
plot(x0,f(x0),'bs');
plot(x1,f(x1),'bs');
plot(x2,f(x2),'bs');

title("Muller's MM1 method f(x)=2*x^4+3*x^3+(-6)*x^2+4*x+7");
hold off;

% print nr of iterations and root
nrIterationsMM1_1
rootMM1_1

nrIterationsMM1_2
rootMM1_2

nrIterationsMM1_3
rootMM1_3

nrIterationsMM1_4
rootMM1_4

% MM2 method
figure(3);
hold on;
grid on;
fplot(f,[-5 4],'k');

% first root
xk = -2.5;
[nrIterationsMM2_1, rootMM2_1] = MM2method(p,xk,50,1e-9);
plot(rootMM2_1,f(rootMM2_1), 'r*');
plot(xk,f(xk),'bs');

% second root
xk = -0.5;
[nrIterationsMM2_2, rootMM2_2] = MM2method(p,xk,50,1e-9);
plot(rootMM2_2,f(rootMM2_2), 'r*');
plot(xk,f(xk),'bs');

% third root
xk = 1+0.25i;
[nrIterationsMM2_3, rootMM2_3] = MM2method(p,xk,50,1e-9);
plot(rootMM2_3,f(rootMM2_3), 'r*');
plot(xk,f(xk),'bs');

% fourth root
xk = 1-0.25i;
[nrIterationsMM2_4, rootMM2_4] = MM2method(p,xk,50,1e-9);
plot(rootMM2_4,f(rootMM2_4), 'r*');
plot(xk,f(xk),'bs');

% print nr of iterations and root
nrIterationsMM2_1
rootMM2_1

nrIterationsMM2_2
rootMM2_2

nrIterationsMM2_3
rootMM2_3

nrIterationsMM2_4
rootMM2_4

title("Muller's MM2 method f(x)=2*x^4+3*x^3+(-6)*x^2+4*x+7");
hold off;

% Newton's method
figure(4);
[iter_Newton1, root_Newton1] = NewtonsMethod(f,50,1e-9,-2.5,-2.5,1,2);
[iter_Newton2, root_Newton2] = NewtonsMethod(f,50,1e-9,-0.5,-0.5,2,2);

hold on;
fplot(f,[-5 4],'k');
title("Newton's method f(x)=2*x^4+3*x^3+(-6)*x^2+4*x+7");
hold off;


%%%%%%%% PROBLEM 3 %%%%%%%%
figure(5);
hold on;
grid on;
fplot(f,[-5 4],'k');

% first root
xk = -2.5;
[iter_Laguerre_1, root_Laguerre_1] = LaguerresMethod(p,xk,10,1e-9);
plot(root_Laguerre_1,f(root_Laguerre_1), 'r*');
plot(xk,f(xk),'bs');

% second root
xk = -0.5;
[iter_Laguerre_2, root_Laguerre_2] = LaguerresMethod(p,xk,50,1e-9);
plot(root_Laguerre_2,f(root_Laguerre_2), 'r*');
plot(xk,f(xk),'bs');

% third root
xk = 1+0.25i;
[iter_Laguerre_3, root_Laguerre_3] = LaguerresMethod(p,xk,50,1e-9);
plot(root_Laguerre_3,f(root_Laguerre_3), 'r*');
plot(xk,f(xk),'bs');

% fourth root
xk = 1-0.25i;
[iter_Laguerre_4, root_Laguerre_4] = LaguerresMethod(p,xk,50,1e-9);
plot(root_Laguerre_4,f(root_Laguerre_4), 'r*');
plot(xk,f(xk),'bs');

% print nr of iterations and root
root_Laguerre_1
iter_Laguerre_1

root_Laguerre_2
iter_Laguerre_2

root_Laguerre_3
iter_Laguerre_3

root_Laguerre_4
iter_Laguerre_4

title("Laguerre's method f(x)=2*x^4+3*x^3+(-6)*x^2+4*x+7");
hold off;


%%%%%%%% FUNCTIONS %%%%%%%%

% Problem 1 Secant Method
function [nrIterations, root] = SecantMethod(f,imax,assumedTolerance,x0,x1,part)

    nrIterations = 1;
    
    hold on;
    grid on;
    
    % for every part of interval use different colors to define intervals
    if(part == 1)
       plot(x0, f(x0), 'cs');
       plot(x1, f(x1), 'cs'); 
    end
    
    if(part == 2)
       plot(x0, f(x0), 'ms');
       plot(x1, f(x1), 'ms');
    end
    
    if(part == 3)
       plot(x0, f(x0), 'bs');
       plot(x1, f(x1), 'bs');
    end
    
    for i=1:imax % max nr of iterations
        
        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0)); % formula to define new point
    
        x0 = x1;
        x1 = x2;
        
        solutionError = abs(x1 - x0); % calculate error
        
        root = x2;
        
        if solutionError < assumedTolerance % if error < tolerance STOP
            break;
        end
  
        nrIterations = nrIterations + 1;
    end

    plot(root, f(root), 'r*'); % plot root on graph
    hold off;
end

% Problem 1 Newtons Method
function [nrIterations, root] = NewtonsMethod(f,imax,assumedTolerance,x0,x1,part,problem)
    
    nrIterations = 1;
    
    hold on;
    grid on;
    
    % for every part of interval use different colours
    if(part == 1)
       plot(x0, f(x0), 'cs');
       plot(x1, f(x1), 'cs'); 
    end
    
    if(part == 2)
       plot(x0, f(x0), 'ms');
       plot(x1, f(x1), 'ms');
    end
    
    if(part == 3)
       plot(x0, f(x0), 'bs');
       plot(x1, f(x1), 'bs');
    end
    
    root = (x0 + x1)/2; % secant
    
    if problem == 1
    df = @(x)(3*sin(x))/10 - 1/(x - 1) + (3*x*cos(x))/10; % derivative of function
    end
    
    if problem == 2
        df = @(x)8*x^3 + 9*x^2 - 12*x + 4; % derivative of function
    end
    
    for i=1:imax
        
        root2 = root; % remember old value
        root = root - (f(root)/df(root)); % iteration formula
        
        solutionError = abs(root - root2);
        
        if solutionError < assumedTolerance % if error < tolerance STOP
            break;
        end      
        
        nrIterations = nrIterations + 1;
    end
    
    plot(root, f(root), 'r*');
end

% Problem 2 MM1 Method
function [nrIterations, root] = MM1method(p,x0,x1,x2,imax,assumedTolerance)
    
    nrIterations = 0;
    c = 1; % something bigger then tolerance to begin with
    
    while nrIterations < imax && abs(c) > assumedTolerance % c = f(x2)
        z0 = x0 - x2;
        z1 = x1 - x2;
        
        % polynomial evaluation
        c = polyval(p,x2);
        a = (polyval(p,x1)*z0 - c*z0 - polyval(p,x0)*z1 + c*z1)/(z1^2*z0 - z0^2*z1);
        b = (polyval(p,x0) - c - a*z0^2)/z0;
        
        delta = b^2-4*a*c;
        
        if abs(b + sqrt(delta)) >= abs(b - sqrt(delta)) % chosing root with smaller value
            zmin = (-2*c)/(b + sqrt(delta)); 
        else
            zmin = (-2*c)/(b - sqrt(delta)); 
        end
        
        root = x2 + zmin;
        
        % looking for two points close to root
        lengthx0 = abs(x0 - root);
        lengthx1 = abs(x1 - root);
        lengthx2 = abs(x2 - root);
        
        % we assume that x2 is root of polynomial
        if lengthx2 >= lengthx1 && lengthx2 >= lengthx0
            x2 = root;
        end
        
        if lengthx1 >= lengthx2 && lengthx1 >= lengthx0
            x1 = x2;
            x2 = root;
        end
        
        if lengthx0 >= lengthx2 && lengthx0 >= lengthx1
            x0 = x2;
            x2 = root;
        end
        
        nrIterations = nrIterations+1;
    end
end

% Problem 2 MM2 Method
function [nrIterations, root] = MM2method(p,root,imax,assumedTolerance)
    
    nrIterations = 0;
    
    % derivatives
    dp = polyder(p);
    d2p = polyder(dp);
    
    c = 1; % something bigger then tolerance to begin with

    while nrIterations < imax && abs(c) > assumedTolerance % c = f(xk)
        
        c = polyval(p,root);
        b = polyval(dp,root);
        a = polyval(d2p,root)/2;
        delta = b^2-4*a*c;
        
        if abs(b + sqrt(delta)) >= abs(b - sqrt(delta)) % chosing root with smaller value
            zmin = (-2*c)/(b + sqrt(delta)); 
        else
            zmin = (-2*c)/(b - sqrt(delta)); 
        end
        
        root = zmin + root;
        
        nrIterations = nrIterations+1;
    end
end

% Problem 3 Laguerres Method
function [nrIterations, root] = LaguerresMethod(p,root,imax,assumedTolerance)
       
    nrIterations = 0;
    
    % derivatives
    dp = polyder(p);
    d2p = polyder(dp);
    n = length(p);
    n = n-1;
    
    c = 1; % something bigger then tolerance to begin with
    
    while nrIterations < imax && c > assumedTolerance % c = f(xk)
        
        c = polyval(p,root);
        
        denominator1 = polyval(dp,root) + sqrt((n-1)*((n-1)*(polyval(dp,root)^2)-n*polyval(p,root)*polyval(d2p,root)));
        denominator2 = polyval(dp,root) - sqrt((n-1)*((n-1)*(polyval(dp,root)^2)-n*polyval(p,root)*polyval(d2p,root)));
        
        % choosing larger value of denominator
        if abs(denominator1) > abs(denominator2)
            denominator = denominator1;
        else
            denominator = denominator2;
        end
        
        % xk+1 = xk - fraction
        root = root - (n*polyval(p,root))/denominator;
        
        nrIterations = nrIterations+1;
    end
end