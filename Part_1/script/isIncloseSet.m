% @file isIncloseSet
% @brief This function is to check whether the current node exists in
% closeSet

function isIn = isIncloseSet(currentNode, closeSet)

    % check the input is correct
    if size(currentNode.coordinate, 2) ~= 2
        disp('!! Wrong Node Input in function isIncloseSet !!');
        return;
    end
    
    isIn = closeSet.containsValue(num2str(currentNode.coordinate));


end