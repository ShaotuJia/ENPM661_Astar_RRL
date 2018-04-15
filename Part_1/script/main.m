% @file main.m 
% @brief This this main script to run the paht finding algorithm using BFS
clc;
clear;


%!!! Set up goal point; Change coordinate to differnt goal point
goal.coordinate = [200 20];

% !!! Set up start point; Change coordinate to different start point
startNode.coordinate = [50 100];
startNode.parent = 0;
startNode.info = 1;
startNode.gScore = 0;
startNode.fScore = startNode.gScore + heuristic_estimate(startNode, goal);

% set length and height for the map
map_length = 250;
map_height = 150;

% resultion of map
resultion = 1;

% initialize openSet and closeSet
 openSet = [];       % contain unvisited nodes; FIFO queue

% try openSet and closeSet as HashTable
closeSet = java.util.Hashtable;
openSetHash = java.util.Hashtable;

% generate bitmap for collision check
bitmap = create_bitmap(map_length, map_height);


% add start node to openSet
openSet = [openSet startNode];
% openSet.put(startNode.info, startNode.coordinate);  % put start node to hashtable openSet
openSetHash.put(startNode.info, startNode.coordinate);

% NodeSet to store all nodes
NodeSet = startNode;

% initialize 2D NodeMap to store node 
emptyNode.coordinate = [];
emptyNode.parent = [];
emptyNode.info = [];
emptyNode.gScore = [];
emptyNode.fScore = [];

NodeMap(map_length+1, map_height+1) = emptyNode;

% while loop for BFS in order to parent nodes
while ~isempty(openSet)
    %currentNode = openSet(1);       % get the first Node from openSet
    %openSet(1) = [];                % pop up first node from openSet
    
    % find the node with lowest fScore and remove that node from openSet
    [currentNode, openSet] = find_Lowest_fScore_Node(openSet);
    
    openSetHash.remove(currentNode.info);       % remove current node from openSetHash
    
    if currentNode.coordinate == goal.coordinate 
        
        %%%%%%%%%%
        path = reconstruct(currentNode, NodeSet);
        %%%%%%%
        
        disp('find goal and use drawMap.m to draw the path on figure');
        return;
    end
    
    % expand Node
    % subtree = expandNode(currentNode, NodeSet, closeSet, openSet, map_length, map_height);
    subtree = expandNode(currentNode, NodeSet, closeSet, openSetHash, map_length, map_height, bitmap);
    
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




