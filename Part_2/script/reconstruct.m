% @file reconstruct
% @brief This function is to reconstruct path from currentNode

function path = reconstruct(currentNode, NodeSet)

% initialize the path from Node to startNode
path = currentNode;

while (currentNode.parent ~= 0)
    currentNode = NodeSet(currentNode.parent);        % set the parent node as current noe
    path = [path currentNode];                      % construct path
    
end

% draw trajectory
total_trajectory = [];
for i = length(path) : -1 : 1
    total_trajectory = [total_trajectory path(i).trajectory];
end

line(total_trajectory(1,:),total_trajectory(2,:), 'color', 'green', 'LineWidth', 4);
hold on;

end