clear; 
clc;

lower_bound = 2;
upper_bound = 11;

%--- Root bracketing ---%

root_num = 0;
iter_num = 0;
while (lower_bound < upper_bound)
    
    iter_num = iter_num + 1;
    
    if (fnTask_1(lower_bound) * fnTask_1(lower_bound + 1) > 0)
        
        lower_bound = lower_bound + 1; 
    else
        %--- Interval contains root of function ---%
        root_num = root_num + 1; 
        
        %--- Call bisection method to determine exact value of x ---%
        %--- for which f(x) = 0 ---%
        [solution(root_num), newton_iter(root_num)] = the_newton_v2(lower_bound, lower_bound+1, lower_bound,0);
        iter_num = iter_num + newton_iter(root_num);
        %--- Carry on looking for intervals, ---% 
        %--- which contain root of function ---% 
        lower_bound = lower_bound + 1;
    end
    
end