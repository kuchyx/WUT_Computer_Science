function Vector = swapValueVector(Vector, i1, i3) 
    tempVal = Vector(i1);
    Vector(i1) = Vector(i3);
    Vector(i3) = tempVal;
end % end function