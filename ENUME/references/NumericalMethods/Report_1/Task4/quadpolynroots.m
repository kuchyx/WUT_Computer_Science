function [x1, x2] = quadpolynroots( a,b,c )

    l1 = -b + sqrt(b*b - 4*a*c);
    l2 = -b - sqrt(b*b - 4*a*c);

    if abs(l1) > abs(l2)
        counter = l1;
    else
        counter = l2;
    end
    x1 = counter/(2 * a);
    x2 = ((-b) / a) - x1;

end