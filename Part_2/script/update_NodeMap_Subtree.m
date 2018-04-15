%@brief This function is to update both NodeMap and Subtree
% if the node's gScore on NodeMap is smaller than the node's gScore on
% Subtree, replace the node on Subtree by the node on NodeMap.
% if the node's gScore on NodeMap is larger than the node's gScore on
% Subtree, replace the node on NodeMap by the node on Subtree.

function [NodeMap, subtree] = update_NodeMap_Subtree(NodeMap, subtree, goal)

    for i = 1 : length(subtree)
        
        % assign one element of subtree to variable neighbor
        neighbor = subtree(i);
        
        % get the coordinate in NodeMap
        % NodeMapCoord = Convert_NodeCoord_to_NodeMapCoord(neighbor);
        NodeMapCoord = subtree(i).coordinate;
        
        % get the node from NodeMap
        NodeOnMap = NodeMap(NodeMapCoord(1), NodeMapCoord(2));
        
        % if there is no Node on the NodeMap, add neighbor to that position
        % else if there is Node on the NodeMap but its gScore is larger
        % than neighor's gScore, add neighbor to that position
        % else update subtree element based on NodeMap
        if (isempty(NodeOnMap.coordinate))
            
            % compute fSocre for new expand node
            subtree(i).fScore =  subtree(i).gScore + heuristic_estimate(subtree(i), goal);
            % update NodeMap
            NodeMap(NodeMapCoord(1), NodeMapCoord(2)) = subtree(i);
        else
            if (neighbor.gScore < NodeOnMap.gScore)
                
            % compute fSocre for new expand node
            subtree(i).fScore =  subtree(i).gScore + heuristic_estimate(subtree(i), goal);
            % update NodeMap
            NodeMap(NodeMapCoord(1), NodeMapCoord(2)) = subtree(i);
            
            else
                subtree(i) = NodeOnMap;
            end
            
        end
    end
             
end