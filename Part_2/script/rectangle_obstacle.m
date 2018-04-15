%@breif Set rectangle obstacle to 1 in bitmap
%@param rectangle; A struct contains [x, y, length(x-direction), height(y-direction)]
%@param turtle_R; the radius of turtlebot
%@param bitmap; bitmap (width, length, resultion)
%@param resultion; the resultion of bitmap 
%@param NodeMap_frame_in_world_frame; the NodeMap frame refers to world
%frame
%@return bitmap; the bitmap with rectangle obstacle

function bitmap = rectangle_obstacle(rectangle, turtle_R, bitmap, resultion, NodeMap_frame_in_world_frame)

    % check if there is enough elements in rectangle struct
    if (length(rectangle) ~= 4)
        disp('No enough elements in rectangle');
    end
    
    % get the length of bitmap
    bitmap_length = length(bitmap(:,1));
    bitmap_height = length(bitmap(1,:));
    
    % assign rectangle to variables
    x = rectangle(1);
    y = rectangle(2);
    rect_length = rectangle(3);
    rect_height = rectangle(4);
    
    % find the cooridnate of LeftDownCorner and RightUpCorner in world
    % frame
    LeftDown = [x-rect_length/2 y-rect_height/2];
    RightUp = [x+rect_length/2 y+rect_height/2];
    
    % the LeftDown and RightUp on NodeMap
    LeftDown_NodeMap = transfer_frame(LeftDown, NodeMap_frame_in_world_frame, resultion);
    RightUp_NodeMap = transfer_frame(RightUp, NodeMap_frame_in_world_frame, resultion);
    
    % range in x-direction for rectangle
    x_left = LeftDown_NodeMap(1)-turtle_R;
    if (x_left < 1)
        x_left = 1;
    end
    
    x_right = RightUp_NodeMap(1)+turtle_R;
    if (x_right > bitmap_length)
        x_right = bitmap_length;
    end
    
    % range in y-direction for rectange
    y_down = LeftDown_NodeMap(2)-turtle_R;
    if (y_down < 1)
        y_down = 1;
    end
    
    y_up = RightUp_NodeMap(2)+turtle_R;
    if (y_up > bitmap_height)
        y_up = bitmap_height;
    end
    
    % range of rectangle
    x_range = [x_left x_right];
    y_range = [y_down y_up];
    
    % change the element within the rectangle to 1
    for i = x_range(1) : x_range(2)
        for j = y_range(1): y_range(2)
            bitmap(i, j) = 1;
        end
    end

end