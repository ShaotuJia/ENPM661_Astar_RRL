% @file expandNode.m
% @brief This file is to expand subtree nodes based on current node root
% @return nodeSubtree The Set of expanded Nodes
% @return numOfNodes The number of nodes in subtree

function [nodeSubtree, numOfNodes] = expandNode(Node, NodeSet, closeSet, openSet, map_length, map_height, bitmap)


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
    
    % expand node on Left if x > 0
    if (Node.coordinate(1) > 0)
        LeftNode.coordinate = [Node.coordinate(1)-1 Node.coordinate(2)];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %if ~isInObstacle(LeftNode)
        if collision_check(bitmap, LeftNode)
             if  ~isInopenSet(LeftNode, openSet)
                if ~isIncloseSet(LeftNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;                % count node numbers in the subtree
                    LeftNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    LeftNode.parent = Node.info;                % set up parent node for new node
                    LeftNode.gScore = Node.gScore + dist_compute(Node, LeftNode);   % compute gScore for LeftNode
                    
                    nodeSubtree = [nodeSubtree LeftNode];
                end
            end
        end
    end
    
    % expand node on right if x < 250 map_length 
    if (Node.coordinate(1) < map_length)
        RightNode.coordinate = [Node.coordinate(1)+1 Node.coordinate(2)];
        % check if LeftNode exists in closeSet or openSet or inside
        % Obstacle 
        %%if ~isInObstacle(RightNode) 
        if collision_check(bitmap, RightNode)
            if ~isInopenSet(RightNode, openSet)
                if ~isIncloseSet(RightNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;                 % count node numbers in the subtree
                    RightNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    RightNode.parent = Node.info;                % set up parent node for new node
                    
                    RightNode.gScore = Node.gScore + dist_compute(Node, RightNode);   % compute gScore for RightNode
                    nodeSubtree = [nodeSubtree RightNode];
                end
            end
        end
    end
    
    % expand upper node if y < 150 map_height
    if (Node.coordinate(2) < map_height)
        UpNode.coordinate = [Node.coordinate(1) Node.coordinate(2)+1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(UpNode)
        if collision_check(bitmap, UpNode)
            if ~isInopenSet(UpNode, openSet)
                if ~isIncloseSet(UpNode, closeSet)
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    UpNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    UpNode.parent = Node.info;                % set up parent node for new node
                    
                    UpNode.gScore = Node.gScore + dist_compute(Node, UpNode);   % compute gScore for UpNode
                    nodeSubtree = [nodeSubtree UpNode];
                end
            end
        end
    end
    
    % expand down node if y > 0 
    if (Node.coordinate(2) > 0)
        DownNode.coordinate = [Node.coordinate(1) Node.coordinate(2)-1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(DownNode)
        if collision_check(bitmap, DownNode)
            if  ~isInopenSet(DownNode, openSet)
                if ~isIncloseSet(DownNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    DownNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    DownNode.parent = Node.info;                % set up parent node for new node      
                    
                    DownNode.gScore = Node.gScore + dist_compute(Node, DownNode);   % compute gScore for DownNode
                    nodeSubtree = [nodeSubtree DownNode];
                end
            end
        end
    end
    
    % expand LeftDown node if x > 1 && y > 1 
    if (Node.coordinate(1) > 0 && Node.coordinate(2) > 0)
        LeftDownNode.coordinate = [Node.coordinate(1)-1 Node.coordinate(2)-1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(LeftDownNode)
        if collision_check(bitmap, LeftDownNode)
            if ~isInopenSet(LeftDownNode, openSet)
                if ~isIncloseSet(LeftDownNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    LeftDownNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    LeftDownNode.parent = Node.info;                % set up parent node for new node       
                    LeftDownNode.gScore = Node.gScore + dist_compute(Node, LeftDownNode);   % compute gScore for LeftDownNode
                    nodeSubtree = [nodeSubtree LeftDownNode];
                end
            end
        end
    end
    
    % expand LeftUp node if x > 0 && y < map_height 
    if (Node.coordinate(1) > 0 && Node.coordinate(2) < map_height)
        LeftUpNode.coordinate = [Node.coordinate(1)-1 Node.coordinate(2)+1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(LeftUpNode) 
        if collision_check(bitmap, LeftUpNode)
            if ~isInopenSet(LeftUpNode, openSet)
                if ~isIncloseSet(LeftUpNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    LeftUpNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    LeftUpNode.parent = Node.info;                % set up parent node for new node   
                    
                    LeftUpNode.gScore = Node.gScore + dist_compute(Node, LeftUpNode);   % compute gScore for LeftUpNode
                    nodeSubtree = [nodeSubtree LeftUpNode];
                end
            end
        end
    end
    
        
    % expand RightDown node if x < map_length && y > 0 
    if (Node.coordinate(1) < map_length && Node.coordinate(2) > 0)
        RightDownNode.coordinate = [Node.coordinate(1)+1 Node.coordinate(2)-1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(RightDownNode) 
        if collision_check(bitmap, RightDownNode)
            if ~isInopenSet(RightDownNode, openSet)
                if ~isIncloseSet(RightDownNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    RightDownNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    RightDownNode.parent = Node.info;                % set up parent node for new node  
                    
                    RightDownNode.gScore = Node.gScore + dist_compute(Node, RightDownNode);   % compute gScore for RightDownNode
                    nodeSubtree = [nodeSubtree RightDownNode];
                end
            end
        end
    end

    % expand RightUp node if x < map_length && y < map_height 
    if (Node.coordinate(1) < map_length && Node.coordinate(2) < map_height)
        RightUpNode.coordinate = [Node.coordinate(1)+1 Node.coordinate(2)+1];
        % check if LeftNode exists in closeSet or openSet or inside Obstacle
        %%if ~isInObstacle(RightUpNode) 
        if collision_check(bitmap, RightUpNode)
            if ~isInopenSet(RightUpNode, openSet)
                if ~isIncloseSet(RightUpNode, closeSet)
            
                    numOfNodes = numOfNodes + 1;              % count node numbers in the subtree
                    RightUpNode.info = SizeOfNodeSet + numOfNodes;     % Set up node info for new node
                    RightUpNode.parent = Node.info;                % set up parent node for new node 
                    
                    RightUpNode.gScore = Node.gScore + dist_compute(Node, RightUpNode);   % compute gScore for RightUpNode
                    nodeSubtree = [nodeSubtree RightUpNode];
                end
            end
        end
    end
    

end