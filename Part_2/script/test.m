%@breif This script is to test function in this project

% test transfer_frame function
%{
NodeMap_frame_in_world_frame = [-5.53 -5.06];
point_in_world = [-5.53 -5.06];
resultion = 0.01;
Node_coordinate = transfer_frame(point_in_world, NodeMap_frame_in_world_frame, resultion);
%}

%{
% test create_bitmap_rrl
NodeMap_frame_in_world_frame = [-5.53 -5.06];
resultion = 0.01;
center_1 = [3.46 4.46];
center_2 = [4.99 0.23];
center_3 = [4.96 -1.36];
center_4 = [-1.9 -0.79];
center_5 = [-2.35 3.38];
center_6 = [-3.46 3.42];
center_7 = [-4.97 1.1];
center_8 = [-4.93 -0.39];
center_9 = [-3.53 -3.05];

coordinate_1 = transfer_frame(center_1, NodeMap_frame_in_world_frame, resultion);
coordinate_2 = transfer_frame(center_2, NodeMap_frame_in_world_frame, resultion);
coordinate_3 = transfer_frame(center_3, NodeMap_frame_in_world_frame, resultion);
coordinate_4 = transfer_frame(center_4, NodeMap_frame_in_world_frame, resultion);
coordinate_5 = transfer_frame(center_5, NodeMap_frame_in_world_frame, resultion);
coordinate_6 = transfer_frame(center_6, NodeMap_frame_in_world_frame, resultion);
coordinate_7 = transfer_frame(center_7, NodeMap_frame_in_world_frame, resultion);
coordinate_8 = transfer_frame(center_8, NodeMap_frame_in_world_frame, resultion);
coordinate_9 = transfer_frame(center_9, NodeMap_frame_in_world_frame, resultion);


% bitmap = create_bitmap_rrl(resultion, NodeMap_frame_in_world_frame);
%}

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test mode for reachability graph
init_coord = [10 10];
init_theta = pi/2;
resultion = 0.01;
time_interval = 1;

% mode 1
[end_point_1, trajectory_1] = mode(1, init_coord, init_theta, resultion, time_interval);
line(trajectory_1(1,:), trajectory_1(2,:));
hold on;

% mode 2
[end_point_2, trajectory_2] = mode(2, init_coord, init_theta, resultion, time_interval);
line(trajectory_2(1,:), trajectory_2(2,:));
hold on;

% mode 3
[end_point_3, trajectory_3] = mode(3, init_coord, init_theta, resultion, time_interval);
line(trajectory_3(1,:), trajectory_3(2,:));
hold on;

% mode 4
[end_point_4, trajectory_4] = mode(4, init_coord, init_theta, resultion, time_interval);
line(trajectory_4(1,:), trajectory_4(2,:));
hold on;
% mode 5
[end_point_5, trajectory_5] = mode(5, init_coord, init_theta, resultion, time_interval);
line(trajectory_5(1,:), trajectory_5(2,:));
hold on;
%}
%{
%draw trajectory
line(path(1).trajectory(1,:), path(1).trajectory(2,:));
 hold on;
line(path(2).trajectory(1,:), path(2).trajectory(2,:));
 hold on;
line(path(3).trajectory(1,:), path(3).trajectory(2,:));
% construct total_trajectory using path
%}


total_trajectory = [];
for i = length(path) : -1 : 1
    total_trajectory = [total_trajectory path(i).trajectory];
end

line(total_trajectory(1,:),total_trajectory(2,:), 'color', 'green', 'LineWidth', 4);
hold on;




