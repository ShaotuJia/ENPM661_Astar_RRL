%@brief This function is to compute the distance between two node

function dist = dist_compute(current_node, next_node)

    % difference in x - direction
    x_diff = current_node.coordinate(1) - next_node.coordinate(1);
    
    % difference in y - direction
    y_diff = current_node.coordinate(2) - next_node.coordinate(2);
    
    % distance between two node
    dist = sqrt(x_diff^2 + y_diff^2);

end