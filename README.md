# ENPM661_Project3 - Turtlebot A* Path Planning in RRL Map 
## Introduction
This project uses A* algorithm to find a path on given maps. There are two parts. Part 1 is an A* path planning based on project 2 map. Part 2 is an A* path planning with holonomic constraints in RRL map.
## Part 1
### Brief
Part 1 uses the map from project 2 and changes the planning algorithm from Dijsktra's to A*. In this path planning, there are no holonomic constraints and the planner will explore 8 neighboring nodes. The heuristic is the Euclidean distance from the current node to goal. 
### How to Run
- go to directory Part_1/script
- open main.m in Matlab
- change the goal.coordinate(line 8)startNode.coordinate(line 11) to the coordinate you want on the map.
- run main.m in Matlab
- open and run drawMap.m after main.m running completed.
### Example Result
Go to directory Part_1/results. There is a example figure that from startNode [50 100] to goal [200 20]. 
## Part 2
### Brief
Part 2 creates a path on RRL map using A* algorithm with holonomic constraints of turtlebot. In this project, the turtlebot DOES NOT allow to move under tables; the turtlebot must completely avoid tables. The radius of turtlebot is 18cm. Thus, the generated path must be 18cm away from any tables. 
### Reachability Graph
Since this planning is under holonomic constraints, we need to use reachability graph for node exploring. Here we have 5 modes for exploring node. 
- mode 1: linear_velocity [0.1 0 0] with unit m/s and angular_velocity [0 0 0.1] with unit radian/s
- mode 2: linear_velocity [0.1 0 0] with unit m/s and angular_velocity [0 0 0.05] with unit radian/s
- mode 3: linear_velocity [0.1 0 0] with unit m/s and angular_velocity [0 0 0] with unit radian/s
- mode 4: linear_velocity [0.1 0 0] with unit m/s and angular_velocity [0 0 -0.05] with unit radian/s
- mode 5: linear_velocity [0.1 0 0] with unit m/s and angular_velocity [0 0 -0.1] with unit radian/s
### How to Run
- go to directory Part_2/script
- open main.m in Matlab
- change the startNode_coordinate_world(line 7) and goal_coordinate_world(line 8) to the coordinate of world frame that you want on the map.
- run main.m in Matlab
- file velo_list.txt is the text file containing linear and angular velocity. 
### Example Result
Go to directory Part_2/results, and there are two example results. In each example folder, there are one figure and one text file. The figure shows explored path(blue curves), startNode(Black Square), goal(blue star) with tolerance(blue circle), obstacles(red rectangles), and planned path(green line). The velo_list.txt contains the linear and angular velocity with time_interval 10 secs. The time_interval means the duration of each mode moving. We can change the time_interval; smaller time_interval will provide finer reachability graph but cost more time for computation. The velo_list.txt can be converted to the gemoetry/Twist message based on publishing rate for moving turtlebot in ROS. 


