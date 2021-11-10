function [x1, x2] = quadpolynroots(a,b,c)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

l1 = -b + sqrt(b*b - 4*a*c);
l2 = -b - sqrt(b*b - 4*a*c);

if abs(l1) > abs(l2)
    ctr = l1;
else
    ctr = l2;
end

x1 = ctr/(2 * a);
x2 = ((-b) / a) - x1;

end

