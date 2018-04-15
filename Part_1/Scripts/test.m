% @file test
% @brief This is a script that test functions used in main

% clc;
% clear;

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test function isInRectangle
point1 = [60 50];   % this point will be inside rectangle
point2 = [1 1];
point3 = 0;
is_point1_in_Rectangle = isInRectangle(point1);
is_point2_in_Rectangle = isInRectangle(point2);
% is_point3_in_Rectangle = isInRectangle(point3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test function isInCircle
point4 = [181 121];
point5 = [220 10];
point6 = 0;
is_point4_in_Circle = isInCircle(point4);
is_point5_in_Circle = isInCircle(point5);
% is_point6_in_Circle = isInCircle(point6);


point_in_triangle = [158 55];
point_in_non_convex = [150 30];
point_not_in_poly = [1 1];

isInNonConvex_1 = isInPolygon(point_in_triangle);
isInNonConvex_2 = isInPolygon(point_in_non_convex);
isInNonConvex_3 = isInPolygon(point_not_in_poly);

testNode.coordinate = point_in_triangle;
InObstacle = isInObstacle(testNode);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test for isIncloseSet
%{
% set up closeSet 
Nodes(1).coordinate = [1 1];
Nodes(1).parent = 0;

Nodes(2).coordinate = [2 2];
Nodes(2).parent = 1;

Nodes(3).coordinate = [3 3];
Nodes(3).parent = 3;

closeSet = Nodes;       %set up closeSet

currentNode.coordinate = [5 5];     %set up current node
currentNode.parent = 0;
isInSet = isIncloseSet(currentNode, closeSet);

%}

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test expandNode
Node.coordinate = [145 14];
Node.parent = 0;
Node.info = 1;

map_length = 250;
map_height = 150;

% set up closeSet
closeSet(1).coordinate = [1 1];
closeSet(1).parent = 0;
closeSet(1).info = 1;

closeSet(2).coordinate = [2 2];
closeSet(2).parent = 0;
closeSet(3).info = 1;

closeSet(3).coordinate = [3 3];
closeSet(3).parent = 30;
closeSet(3).info = 3;

closeSet(4).coordinate = [4 4];
closeSet(4).parent = 30;
closeSet(4).info = 3;

subtree = expandNode(Node, closeSet, map_length, map_height);
%}
%{
check =[];
for i = 1 : length(path)
    isIn = isInRectangle(path(i).coordinate);
    check = [check isIn];
end
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check generated bitmap
%{
width = 250;
height = 150;

bitmap = create_bitmap(width, height);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check heuristic estimate
%{
node.coordinate = [1 1];
goal.coordinate = [2 1];

heuristic = heuristic_estimate(node, goal);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%check Convert_NodeCoord_to_NodeMapCoord
Node.coordinate = [1 0];
NodeMapCoordinate =  Convert_NodeCoord_to_NodeMapCoord(Node);





