function [root, iter_num] = the_newton_v2(lower_bound, upper_bound, x, iter_num)
   
    iter_num = iter_num + 1;

    x_next = x - (fnTask_2(x) / dfnTask_2(x));
    
    if (x_next < lower_bound || x_next > upper_bound)
        error ('Method is divergent over given interval');
    elseif (abs(x-x_next) <= 1e-10)
        root = x_next;
    else
        [root, iter_num] = the_newton_v2(lower_bound, upper_bound, x_next, iter_num);
    end
    
end