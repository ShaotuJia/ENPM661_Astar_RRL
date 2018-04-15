%@brief This function is to estimate the heuristic cost from node to goal
% the heuristic is the straight distance between node to goal
%@file heuristic_estimate.m
%@param node; the node we want to estimate its heuristic
%@param goal; the goal of path planning
%@return dist; the distance between node and goal; heuristic cost

function dist = heuristic_estimate(node, goal)
    
    % difference in x - direction
    x_diff = node.coordinate(1) - goal.coordinate(1);
    
    % difference in y - direction
    y_diff = node.coordinate(2) - goal.coordinate(2);
    
    % distance between two node
    dist = sqrt(x_diff^2 + y_diff^2);
    

end
