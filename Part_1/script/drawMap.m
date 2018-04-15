% @file drawMap.m
% @brief This script is to draw the given map after running main.m !

% draw rectangle
rectangle_height = 45;
rectangle_length = 50;
leftDownCorner = [55 67.5];
leftUpCorner = [55 112.5];
rightDownCorner = [105 67.5];
rightUpCorner = [105 112.5];

rectangle('Position', [leftDownCorner [rectangle_length rectangle_height]], 'EdgeColor','r', 'LineWidth',3);
hold on;

% draw circle
% set the center of circle
xc = 180;
yc = 120;
radius = 15;
viscircles([xc yc], radius);
hold on;

% draw non-convex ploygon
% set coordinate of vertrice of polygon
A = [145 14];
B = [120 55];
C = [165 89];
D = [158 51];
E = [188 51];
F = [168 14];

ployX = [A(1)  B(1) D(1) C(1) E(1) F(1) A(1)];
ployY = [A(2)  B(2) D(2) C(2) E(2) F(2) A(2)];
plot(ployX, ployY, 'r','LineWidth',2);
hold on;
xlim([0 250]);
ylim([0 150]);
hold on;

route.x = [];
route.y = [];

for i = 1 : length(path)
    route.x = [route.x path(i).coordinate(1)];
    route.y = [route.y path(i).coordinate(2)];
end

% draw path on the graph
line(route.x, route.y, 'color', 'green');
hold on;

% draw start and end point on graph
plot(startNode.coordinate(1), startNode.coordinate(2),'-s','MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0] );
hold on;

plot(goal.coordinate(1), goal.coordinate(2),'-p', 'MarkerEdgeColor','blue', ....
    'MarkerFaceColor','blue',...
    'MarkerSize',15 );
hold on;
