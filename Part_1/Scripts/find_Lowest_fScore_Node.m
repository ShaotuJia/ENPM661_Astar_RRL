%@brief This function is to find the node with minimum fScore in a openSet;
%eg. openSet; And also remove that node from openSet


function [Lowest_f_Node, New_openSet] = find_Lowest_fScore_Node(openSet)

    % find the node index of the node with minimum fScore
    winner=1;
    for i=1:length(openSet)
        if openSet(i).fScore < openSet(winner).fScore
            winner=i;
        end
    end
    
    Lowest_f_Node = openSet(winner);
    openSet(winner) = [];       %remove this node from openSet
    
    New_openSet = openSet;
    
end

    

