% @file isInCircle
% @brief this is the function to check the point whether inside the
% circle obstacle
% @param point This is the coordinate of 2D point on the map; e.g [2, 3]
% means x = 2 and y = 3
% @return isInside Whether the point is side the circle

function isIn = isInCircle(point)
dimSize = size(point, 2);       % dimension of point
if dimSize ~= 2             % check whether the input is correct
    disp('The input point is not 2D !!');
    return;
end

r = 15;         % the radius of circle
dist = sqrt((point(1) - 180)^2 + (point(2) - 120)^2); % the distance between point and center of circle

if le(dist,r)           % check whether point is inside the circle
    isIn = true;
else
    isIn = false;
end

end