%@brief create a bitmap of RRL map for collision checking
%@param turtle_R; the Radius of turtlebot
%@param resultion; the resultion of map
%@param NodeMap_frame_in_world_frame; the coordinate of NodeMap frame in
%world frame
%@return bitmap

function bitmap = create_bitmap_rrl(turtle_R, resultion, NodeMap_frame_in_world_frame)

% get width and height
width = abs(NodeMap_frame_in_world_frame(1))*2;
height = abs(NodeMap_frame_in_world_frame(2))*2;

% get the size of bitmap
bitmap_width = round(width/resultion);
bitmap_height = round(height/resultion);

% initialize bitmap with desried size
bitmap = zeros(bitmap_width+1, bitmap_height+1);

% set position and geometry for table
table_1 = [3.46 4.46 1.5 0.8];
table_2 = [4.99 0.23 0.8 1.5];
table_3 = [4.96 -1.36 0.8 1.5];
table_4 = [-1.9 -0.79 0.8 1.5];
table_5 = [-2.35 3.38 0.8 1.5];
table_6 = [-3.46 3.42 0.8 1.5];
table_7 = [-4.97 1.1 0.8 1.5];
table_8 = [-4.93 -0.39 0.8 1.5];
caffe_table_9 = [-3.53 -3.05 0.92 0.92];

% create obstacle set 
obstacle_set = [table_1; table_2; table_3; table_4; table_5; table_6; table_7; table_8; caffe_table_9];

% add obstacles on bitmap
for i = 1 : length(obstacle_set)
    bitmap = rectangle_obstacle(obstacle_set(i,:), turtle_R, bitmap, resultion, NodeMap_frame_in_world_frame);
end


end