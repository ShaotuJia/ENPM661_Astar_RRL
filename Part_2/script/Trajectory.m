%@brief This function computes the trajectory of each given mode   
%@param v_init; the speed of agent at initial state
%@param w_init; the angular speed of agent at initial state
%@param theta_init; the orientation at initial state
%@param x_start; x - coordinate at initial state
%@param y_start; y - coordinate at initial state
%@return endpoint; [x y orientation move_cost]
%@return h; the line of trajectory

function [endpoint, trajectory] = Trajectory(v_init, w_init, theta_init, t_min, x_start, y_start)

% initialize the function of displacement along x and y axis
%delta_x = @(t) cos(w_init .* t + theta_init) .* (v_init);
%delta_y = @(t) sin(w_init .* t + theta_init) .* (v_init);



% initialize move_cost
move_cost = 0;

% Initialize the start point to draw a increment line
seg_X = x_start;
seg_Y = y_start;

%Initialize step
step = t_min/20;

for t = 0: step : t_min

% obtain the distance between reached point to goal 
% deltaX = integral(delta_x, 0 , t, 'ArrayValued',true);
% deltaY = integral(delta_y, 0 , t, 'ArrayValued',true);
deltaX = cos(w_init * t + theta_init) * (v_init * t);
deltaY = sin(w_init * t + theta_init) * (v_init * t);


% compute cost of movement
move_cost = move_cost + sqrt(deltaX^2 + deltaY^2);

% Get end point of small increment
seg_X(end + 1) = x_start + deltaX;
seg_Y(end + 1) = y_start + deltaY;

end

% round the end point to integer
%seg_X = [seg_X round(seg_X(end))];
%seg_Y = [seg_Y round(seg_Y(end))];

% get the orientation of endpoint
end_theta = w_init * t_min + theta_init;
% assign value for end point coordinate
endpoint = [seg_X(end) seg_Y(end) end_theta move_cost];


% store trajectory for future draw
trajectory = [seg_X; seg_Y];

% draw trajectory
% h = line(seg_X, seg_Y);
% hold on;

end

