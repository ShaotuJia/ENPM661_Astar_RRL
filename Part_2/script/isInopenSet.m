% @file isInopenSet
% @brief This is to check if the node exists in openSet
function isIn = isInopenSet(currentNode, openSetHash)

    % if No element in openSet return false
    if openSetHash.isEmpty()
        isIn = false;
        return;
    end
    
    
    % check the input is correct
    if size(currentNode.coordinate, 2) ~= 2
        disp('!! Wrong Node Input in function isIncloseSet !!');
        return;
    end
    
    isIn = openSetHash.containsValue(num2str(currentNode.coordinate));
    
end