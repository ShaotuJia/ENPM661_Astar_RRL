%@brief Collision Check using bitmap
%@param bitmap; generated bitmap
%@param point; 
%@return true if NO collision; else return false

function free = collision_check(point_coordinate, bitmap)

% assign node coordinate to point
point = [round(point_coordinate(1)) round(point_coordinate(2))];

% if the value of this cooridnate is 0 means no collision return true
% else return false
if bitmap(point(1), point(2))
    free = false;
else
    free = true;
end
end
