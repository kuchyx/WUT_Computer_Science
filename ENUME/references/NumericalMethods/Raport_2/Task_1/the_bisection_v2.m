function [root, iter_num, accuracy] = the_bisection_v2(lower_bound, upper_bound, iter_num)
    
    middle_point = (lower_bound + upper_bound) / 2;
    fn_middle_point = fnTask_1(middle_point);
    
    if (abs(fn_middle_point) <= 1e-10 && upper_bound - lower_bound < 0.1) 
        %--- Test for solution accuracy ---%
        %--- and interval length ---%
        accuracy = 1/2 * (upper_bound - lower_bound);
        iter_num = iter_num + 1;
        root = middle_point; 
    elseif (fn_middle_point * fnTask_1(upper_bound) < 0)
        %--- root is located between middle point and upper bound ---%
        iter_num = iter_num + 1;
        [root, iter_num, accuracy] = the_bisection_v2(middle_point, upper_bound, iter_num);
    elseif (fnTask_1(lower_bound) * fn_middle_point < 0)
        %--- root is located between lower bound and middle point ---%
        iter_num = iter_num + 1;
        [root, iter_num, accuracy] = the_bisection_v2(lower_bound, middle_point, iter_num);
    else
        
        error('Interval does not consist of function root.');
    end
end