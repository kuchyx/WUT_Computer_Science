function [macheps] = macheps()
%MACHEPS function calculates machine epsilon
%   finds smallest number E that 1+E>1
macheps = 1;
while( 1 + ( macheps / 2 ) > 1 )
    macheps = macheps/2;
end
end