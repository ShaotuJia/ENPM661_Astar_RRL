% @file expandNode.m
% @brief This file is to expand subtree nodes based on current node root
% @return nodeSubtree The Set of expanded Nodes
% @return numOfNodes The number of nodes in subtree

function [nodeSubtree, numOfNodes] = expandNode(Node, NodeSet, closeSet, openSet, bitmap, time_interval, resultion)


    % generate bitmap for collsion check
    % bitmap = create_bitmap(map_length, map_height);
    
    % check the input is correct
    if size(Node.coordinate, 2) ~= 2
        disp('!! Wrong Node Input in function expandNode !!');
        return;
    end
    
    % get the length of nodeSet
    SizeOfNodeSet = length(NodeSet);
    
        
    % initialize numofNodes
    numOfNodes = 0;
    
    % initialize nodeSubtree
    nodeSubtree = [];
    
    % intialize coordinate and orientation
    init_coord = Node.actual_coord;
    init_theta = Node.orient;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % expand node using mode 1
    [endpoint_1, trajectory_1] = mode(1, init_coord, init_theta, resultion, time_interval);
    endpoint_1_coord = [round(endpoint_1(1)) round(endpoint_1(2))];     % the coordinate on NodeMap
    
    % check if the end_point_1 is within the bitmap
    if ((is_within_bitmap(endpoint_1_coord, bitmap)) && collision_check(endpoint_1_coord, bitmap))
        
        % assign node_1 element
        node_1.coordinate = endpoint_1_coord;               % coordinate on NodeMap
        node_1.orient = endpoint_1(3);
        node_1.actual_coord = [endpoint_1(1) endpoint_1(2)];    % actual coordinate
        
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
             if  ~isInopenSet(node_1, openSet)
                if ~isIncloseSet(node_1, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    node_1.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    node_1.parent = Node.info;                % set up parent node for new node
                    node_1.trajectory = trajectory_1;           % set up trajectory
                    node_1.gScore = Node.gScore + endpoint_1(4);   % compute gScore for LeftNode
                    node_1.mode = 1;                                % set mode number for node
                    
                    nodeSubtree = [nodeSubtree node_1];
                    
                    %draw trajectory
                    line(trajectory_1(1,:), trajectory_1(2,:));
                    hold on;
                end
            end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % expand node using mode 2
    [endpoint_2, trajectory_2] = mode(2, init_coord, init_theta, resultion, time_interval);
    endpoint_2_coord = [round(endpoint_2(1)) round(endpoint_2(2))];
    
    % check if the end_point_1 is within the bitmap
    if ((is_within_bitmap(endpoint_2_coord, bitmap)) && collision_check(endpoint_2_coord, bitmap))
        
        % assign node_2 element
        node_2.coordinate = endpoint_2_coord;                   % coordinate on NodeMap
        node_2.orient = endpoint_2(3);
        node_2.actual_coord = [endpoint_2(1) endpoint_2(2)];    % acutal coorindate
        
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
             if  ~isInopenSet(node_2, openSet)
                if ~isIncloseSet(node_2, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    node_2.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    node_2.parent = Node.info;                % set up parent node for new node
                    node_2.trajectory = trajectory_2;           % set up trajectory
                    node_2.gScore = Node.gScore + endpoint_2(4);   % compute gScore for LeftNode
                    node_2.mode = 1;                                % set mode number for node
                    
                    nodeSubtree = [nodeSubtree node_2];
                    
                    %draw trajectory
                    line(trajectory_2(1,:), trajectory_2(2,:));
                    hold on;
                end
            end
    end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % expand node using mode 3
    [endpoint_3, trajectory_3] = mode(3, init_coord, init_theta, resultion, time_interval);
    endpoint_3_coord = [round(endpoint_3(1)) round(endpoint_3(2))];
    
    % check if the end_point_1 is within the bitmap
    if ((is_within_bitmap(endpoint_3_coord, bitmap)) && collision_check(endpoint_3_coord, bitmap))
        
        % assign node_3 element
        node_3.coordinate = endpoint_3_coord;                   % coordinate on NodeMap
        node_3.orient = endpoint_3(3);
        node_3.actual_coord = [endpoint_3(1) endpoint_3(2)];    % actual coordinate
        
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
             if  ~isInopenSet(node_3, openSet)
                if ~isIncloseSet(node_3, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    node_3.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    node_3.parent = Node.info;                % set up parent node for new node
                    node_3.trajectory = trajectory_3;           % set up trajectory
                    node_3.gScore = Node.gScore + endpoint_3(4);   % compute gScore for LeftNode
                    node_3.mode = 3;                                % set mode number for node
                    
                    nodeSubtree = [nodeSubtree node_3];
                    
                    %draw trajectory
                    line(trajectory_3(1,:), trajectory_3(2,:));
                    hold on;
                    
                end
            end
    end
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % expand node using mode 4
    [endpoint_4, trajectory_4] = mode(4, init_coord, init_theta, resultion, time_interval);
    endpoint_4_coord = [round(endpoint_4(1)) round(endpoint_4(2))];
    
    % check if the end_point_1 is within the bitmap
    if ((is_within_bitmap(endpoint_4_coord, bitmap)) && collision_check(endpoint_4_coord, bitmap))
        
        % assign node_4 element
        node_4.coordinate = endpoint_4_coord;                       % cooridnate on NodeMap
        node_4.orient = endpoint_4(3);
        node_4.actual_coord = [endpoint_4(1) endpoint_4(2)];        % actual cooridnate 
        
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
             if  ~isInopenSet(node_4, openSet)
                if ~isIncloseSet(node_4, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    node_4.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    node_4.parent = Node.info;                % set up parent node for new node
                    node_4.trajectory = trajectory_4;           % set up trajectory
                    node_4.gScore = Node.gScore + endpoint_4(4);   % compute gScore for LeftNode
                    node_4.mode = 4;                                % set mode number for node
                    
                    nodeSubtree = [nodeSubtree node_4];
                    
                    %draw trajectory
                    line(trajectory_4(1,:), trajectory_4(2,:));
                    hold on;
                    
                end
            end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % expand node using mode 5
    [endpoint_5, trajectory_5] = mode(5, init_coord, init_theta, resultion, time_interval);
    endpoint_5_coord = [round(endpoint_5(1)) round(endpoint_5(2))];
    
    % check if the end_point_1 is within the bitmap
    if ((is_within_bitmap(endpoint_5_coord, bitmap)) && collision_check(endpoint_5_coord, bitmap))
        
        % assign node_5 element
        node_5.coordinate = endpoint_5_coord;
        node_5.orient = endpoint_5(3);
        node_5.actual_coord = [endpoint_5(1) endpoint_5(2)];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
             if  ~isInopenSet(node_5, openSet)
                if ~isIncloseSet(node_5, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    node_5.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    node_5.parent = Node.info;                % set up parent node for new node
                    node_5.trajectory = trajectory_5;           % set up trajectory
                    node_5.gScore = Node.gScore + endpoint_5(4);   % compute gScore for LeftNode
                    node_5.mode = 5;                                % set mode number for node
                    
                    nodeSubtree = [nodeSubtree node_5];
                    
                    %draw trajectory
                    line(trajectory_5(1,:), trajectory_5(2,:));
                    hold on;
                    
                end
            end
    end