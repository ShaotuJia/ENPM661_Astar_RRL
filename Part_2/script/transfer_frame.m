%@brief Transfer map world coordinate frame to coordinate in NodeMap

function coord_on_NodeMap = transfer_frame(coord_world_frame, NodeMap_frame_in_world_frame, resultion)

    % transfer frame from world frame to NodeMap frame
    x_NodeMap_frame = coord_world_frame(1)-NodeMap_frame_in_world_frame(1);
    
    y_NodeMap_frame = coord_world_frame(2)-NodeMap_frame_in_world_frame(2);
    
    % amplify coordinate by resultion and plus 1 for index convention
    x_NodeMap = round(x_NodeMap_frame/resultion) + 1;
    y_NodeMap = round(y_NodeMap_frame/resultion) + 1;
    
    % assign coordinate to variable coord_on_NodeMap
    coord_on_NodeMap = [x_NodeMap y_NodeMap];
    
    
end