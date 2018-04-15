%@brief This function is to initially draw graph for path planning
%@param startNode;
%@param goal;
%@param resultion;
%@param tolerance; the tolerance between node to goal
%@param NodeMap_frame_in_world_frame;

function draw_graph(startNode, goal, resultion, tolerance, NodeMap_frame_in_world_frame)


% set position and geometry for table
table_1 = [3.46 4.46 1.5 0.8];
table_2 = [4.99 0.23 0.8 1.5];
table_3 = [4.96 -1.36 0.8 1.5];
table_4 = [-1.9 -0.79 0.8 1.5];
table_5 = [-2.35 3.38 0.8 1.5];
table_6 = [-3.46 3.42 0.8 1.5];
table_7 = [-4.97 1.1 0.8 1.5];
table_8 = [-4.93 -0.39 0.8 1.5];
caffe_table_9 = [-3.53 -3.05 0.91 0.91];

% covert to rectangle for drawing graph
rectangle_1 = convert_rectangle(table_1, NodeMap_frame_in_world_frame, resultion);
rectangle_2 = convert_rectangle(table_2, NodeMap_frame_in_world_frame, resultion);
rectangle_3 = convert_rectangle(table_3, NodeMap_frame_in_world_frame, resultion);
rectangle_4 = convert_rectangle(table_4, NodeMap_frame_in_world_frame, resultion);
rectangle_5 = convert_rectangle(table_5, NodeMap_frame_in_world_frame, resultion);
rectangle_6 = convert_rectangle(table_6, NodeMap_frame_in_world_frame, resultion);
rectangle_7 = convert_rectangle(table_7, NodeMap_frame_in_world_frame, resultion);
rectangle_8 = convert_rectangle(table_8, NodeMap_frame_in_world_frame, resultion);
rectangle_9 = convert_rectangle(caffe_table_9, NodeMap_frame_in_world_frame, resultion);

% draw obstacles on graph
rectangle('Position', rectangle_1, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_2, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_3, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_4, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_5, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_6, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_7, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_8, 'EdgeColor','r', 'LineWidth',3), hold on;
rectangle('Position', rectangle_9, 'EdgeColor','r', 'LineWidth',3), hold on;

% set graph x, y size
ax = gca;
ax.XLim = [0 1107];
ax.YLim = [0 1013];

% draw start and end point
% draw start and end point on graph
plot(startNode.coordinate(1), startNode.coordinate(2),'-s','MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0] );
hold on;

plot(goal.coordinate(1), goal.coordinate(2),'-p', 'MarkerEdgeColor','blue', ....
    'MarkerFaceColor','blue',...
    'MarkerSize',15 );
hold on;

% tolerance circle of goal
center = [goal.coordinate(1) goal.coordinate(2)];
radii = tolerance;
viscircles(center,radii, 'color', 'blue');
hold on;





