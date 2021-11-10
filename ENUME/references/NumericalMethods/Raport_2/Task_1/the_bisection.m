function the_bisection(lower_bound, upper_bound)
    
        %----- Divide Current Interval Into Two Equal Subintervals -----%
    
        middle_point = (upper_bound + lower_bound)/2;
        
        %----- Calculate value of function for given argument -----%
        fn_value_upper_bound = fnTask_1(upper_bound);
        fn_value_middle_point = fnTask_1(middle_point);
        fn_value_lower_bound = fnTask_1(lower_bound);
        
        %----- Check whether obtained value is close enough -----%
        %----- to assumed tolerance -----%
        %----- Try code in case result is converge -----% 
        %----- to inf or nan value -----%
        
        answer = abs(fn_value_middle_point) > 1e-10;
        
        if (answer && ~isinf(fn_value_middle_point) && ~isnan(fn_value_middle_point))
            %----- Call the_bisection method -----%
            %----- for newly found intervals -----%
            if (fn_value_lower_bound * fn_value_middle_point < 0 || upper_bound - lower_bound > 0.001)
           
                the_bisection(lower_bound, middle_point); 
            end
        
            if (fn_value_upper_bound * fn_value_middle_point < 0 || upper_bound - lower_bound > 0.001)
           
                the_bisection(middle_point, upper_bound); 
            end
            
        else
            %----- Display found solution -----%
            disp(middle_point);   
        end
        
end