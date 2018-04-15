% @file isInRectangle
% @brief this is the function to check the point whether inside the
% rectangle obstacle
% @param point This is the coordinate of 2D point on the map; e.g [2, 3]
% means x = 2 and y = 3
% @return isInside Whether the point is side the rectangle
function isInside = isInRectangle(point)
dimSize = size(point, 2);       % dimension of point

if dimSize ~= 2             % check whether the input is correct
    disp('The input point is not 2D !!');
    return;
end 
if ge(point(1), 55) && le(point(1), 105) && ge(point(2), 67.5) && le(point(2), 112.5)
        isInside = true;
else
    isInside = false;
    
end