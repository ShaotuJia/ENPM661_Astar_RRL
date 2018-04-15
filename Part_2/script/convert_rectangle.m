%@brief Convert table coordinate [center_x center_y length height] to
%NodeMap coordinate [leftDown_x leftDown_y amplified_length amplified_height]
%@param table; the table parameter in world frame
%@param NodeMap_frame_in_world_frame;
%@param resultion; 
%@return rectangle_NodeMap; The rectangle in NodeMap

function rectangle_NodeMap = convert_rectangle(table, NodeMap_frame_in_world_frame, resultion)

table_center_x = table(1);
table_center_y = table(2);
table_length = table(3);
table_height = table(4);

leftDownCorner = [table_center_x-(table_length/2) table_center_y-(table_height/4)];

leftDown_NodeMap = transfer_frame(leftDownCorner, NodeMap_frame_in_world_frame, resultion);

rectangle_NodeMap = [leftDown_NodeMap table_length/resultion table_height/resultion];



end