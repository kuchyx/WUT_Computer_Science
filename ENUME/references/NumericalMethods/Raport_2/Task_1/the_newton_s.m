function the_newton_s (lower_bound, upper_bound)

    if (fnTask_1(lower_bound) * fnTask_1(upper_bound) < 0)
        %--- At least one root within interval ---%
        
        x = lower_bound;
        x_next = x - (fnTask_1(x) / dfnTask_1(x));
    
        
        if (x_next < lower_bound || x_next > upper_bound)
            %--- Method is not convergent over given interval ---%
            %--- Narrow range usisng bisection ---%
            the_newton_s (lower_bound, (lower_bound + upper_bound) / 2);
            the_newton_s ((lower_bound + upper_bound) / 2, upper_bound);
        else
            %--- Method is convergent over given interval ---%
            while (abs(x-x_next) > 1e-10)
                x = x_next;
                x_next = x - (fnTask_1(x) / dfnTask_1(x));
            end
           
            disp(double(x_next));         
                        
        end
        
    else
        %--- Function has no root over given interval ---%
        %--- or range is to wide ---%
 
        if (upper_bound - lower_bound > 0.1)
            %--- Narrow interval untill it is smaller than one assumed ---%
            the_newton_s (lower_bound, (lower_bound + upper_bound) / 2);
            the_newton_s ((lower_bound + upper_bound) / 2, upper_bound);
        end
        
        %--- none root found ---%
    end

end

