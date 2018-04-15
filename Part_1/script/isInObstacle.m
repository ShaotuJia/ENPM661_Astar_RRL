% @file isInobstacle
% @brief check if node is inside osbstacle
% @return bool isIn

function isIn = isInObstacle(Node)
    if isInCircle(Node.coordinate) || isInPolygon(Node.coordinate) || isInRectangle(Node.coordinate)
        isIn = true;
    else
        isIn = false;
    end

end