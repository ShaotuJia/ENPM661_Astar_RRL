% @file reconstruct
% @brief This function is to reconstruct path from currentNode

function path = reconstruct(currentNode, NodeSet)

% initialize the path from Node to startNode
path = currentNode;

while (currentNode.parent ~= 0)
    currentNode = NodeSet(currentNode.parent);        % set the parent node as current noe
    path = [path currentNode];                      % construct path
    
end

end