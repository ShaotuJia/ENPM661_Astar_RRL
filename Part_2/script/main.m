% @file main.m 
% @brief This this main script to run the paht finding algorithm using BFS
clc;
clear;

% set startNode and goal coordinate based on world coordinate
startNode_coordinate_world = [-5.44 4.93];
goal_coordinaet_world = [-0.01 -4.07];

% NodeMap frame in world frame
NodeMap_frame_in_world_frame = [-5.53 -5.06];

% resultion of map
resultion = 0.01;

% set time_interval
time_interval = 10;

% the radius of turtlebot
turtle_R = 18;          % radius = 18 cm

%!!! Set up goal point; Change coordinate to differnt goal point
% goal.coordinate = [553 100];
goal.coordinate = transfer_frame(goal_coordinaet_world, NodeMap_frame_in_world_frame, resultion);

% set tolerance for goal
tolerance = 50;         % a circle of 50 cm
% !!! Set up start point; Change coordinate to different start point
% startNode.coordinate = [10 1000];
startNode.coordinate = transfer_frame(startNode_coordinate_world, NodeMap_frame_in_world_frame, resultion);
startNode.orient = -pi/2;
startNode.parent = 0;
startNode.trajectory = [];
startNode.info = 1;
startNode.gScore = 0;
startNode.fScore = startNode.gScore + heuristic_estimate(startNode, goal);
startNode.actual_coord = startNode.coordinate;
startNode.mode = [];



% intially draw graph
draw_graph(startNode, goal, resultion, tolerance, NodeMap_frame_in_world_frame)

% initialize openSet and closeSet
 openSet = [];       % contain unvisited nodes; FIFO queue

% try openSet and closeSet as HashTable
closeSet = java.util.Hashtable;
openSetHash = java.util.Hashtable;

% generate bitmap for collision check
bitmap = create_bitmap_rrl(turtle_R, resultion, NodeMap_frame_in_world_frame);


% add start node to openSet
openSet = [openSet startNode];
% openSet.put(startNode.info, startNode.coordinate);  % put start node to hashtable openSet
openSetHash.put(startNode.info, startNode.coordinate);

% NodeSet to store all nodes
NodeSet = startNode;

% initialize 2D NodeMap to store node 
emptyNode.coordinate = [];
emptyNode.orient = [];
emptyNode.trajectory = [];
emptyNode.parent = [];
emptyNode.info = [];
emptyNode.gScore = [];
emptyNode.fScore = [];
emptyNode.actual_coord = [];    % the actual_coordinate without round to integer
emptyNode.mode = [];

% create a NodeMap with same size of bitmap
bitmap_length = length(bitmap(:,1));
bitmap_height = length(bitmap(1,:));
NodeMap(bitmap_length, bitmap_height) = emptyNode;


% while loop for A* algorithm
while ~isempty(openSet)
    %currentNode = openSet(1);       % get the first Node from openSet
    %openSet(1) = [];                % pop up first node from openSet
    
    % find the node with lowest fScore and remove that node from openSet
    [currentNode, openSet] = find_Lowest_fScore_Node(openSet);
    
    openSetHash.remove(currentNode.info);       % remove current node from openSetHash
    
    if isReachGoal(currentNode, goal, tolerance)
        
        %%%%%%%%%%
        path = reconstruct(currentNode, NodeSet);
        %%%%%%%
        
        % export linear and angular velocity to text file
        export_velocity(path, time_interval);
        
        disp('find goal and export velocity to velo_list.txt');
        return;
    end
    
    % expand Node
    % subtree = expandNode(currentNode, NodeSet, closeSet, openSet, map_length, map_height);
    subtree = expandNode(currentNode, NodeSet, closeSet, openSetHash, bitmap, time_interval, resultion);
    
    % update both NodeMap and subtree based on their gScore
    [NodeMap, subtree] = update_NodeMap_Subtree(NodeMap, subtree, goal);
    
    % add subtree to NodeSet to build database
    NodeSet = [NodeSet subtree];
    
    % add subtree to openSet
    openSet = [openSet subtree];
    
    % add subtree to openSetHash
    openSetHash = subtreeAddToHashTable(subtree, openSetHash);
    
    % add currentNode to closeSet
    closeSet.put(currentNode.info, num2str(currentNode.coordinate));
    
end





