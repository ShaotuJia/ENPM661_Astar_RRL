%@brief Collision Check using bitmap
%@param bitmap; generated bitmap
%@param point; 
%@return true if NO collision; else return false

function free = collision_check(bitmap, Node)

% assign node coordinate to point
point = Node.coordinate;

% if the value of this cooridnate is 0 means no collision return true
% else return false
if bitmap(point(1) + 1, point(2) + 1)
    free = false;
else
    free = true;
end
end
