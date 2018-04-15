%@brief check if the currentNode is within the tolerance of goal Node
%@param currentNode
%@param goal
%@param tolerance (mm)

function reachGoal = isReachGoal(currentNode, goal, tolerance)

 dist = dist_compute(currentNode, goal);
 
 if dist < tolerance
     reachGoal = true;
 else
     reachGoal = false;
 end
 
end
