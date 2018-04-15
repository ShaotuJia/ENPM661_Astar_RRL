%@brief This function is to select pre-set action mode
%@param mode_num; the number of mode 1 ~ 5  
%@param init_coord; [x y] of initial point in NodeMap
%@param init_theta; the orientation of initial point in NodeMap
%@param resultion; NodeMap resultion
%@param time_interval; the moving time in this mode
%@return end_point; [x y theta move_cost]; the move_cost is the cost moving
%from start to end; it will be used to compute gScore for Node
%@return h; the line of trajectory
function [end_point, trajectory] = mode(mode_num, init_coord, init_theta, resultion, time_interval)

% check mode_num input if 1 < mode_num < 5
if (mode_num < 1 || mode_num > 5)
    error_msg = 'mode_num exceed 1 to 5';
    error(error_msg);
end

% assign variables
x_start = init_coord(1);
y_start = init_coord(2);

% mode 1 
if (mode_num == 1)
    linear_velo_1 = 0.1 / resultion;        % linear velocity 0.1m/s        
    angular_velo_1 = 0.1;                   % angular velocity 0.5 radian/s
    
    [end_point, trajectory] = Trajectory(linear_velo_1, angular_velo_1, init_theta, time_interval, x_start, y_start);
    
end

% mode 2
if (mode_num == 2)
    linear_velo_2 = 0.1 / resultion;        % linear velocity 0.1m/s        
    angular_velo_2 = 0.05;                   % angular velocity 0.5 radian/s
    
    [end_point, trajectory] = Trajectory(linear_velo_2, angular_velo_2, init_theta, time_interval, x_start, y_start);

end

% mode 3
if (mode_num == 3)
    linear_velo_3 = 0.1 / resultion;        % linear velocity 0.1m/s        
    angular_velo_3 = 0;                   % angular velocity 0.5 radian/s
    
    [end_point, trajectory] = Trajectory(linear_velo_3, angular_velo_3, init_theta, time_interval, x_start, y_start);
    
end

% mode 4 
if (mode_num == 4)
    linear_velo_4 = 0.1 / resultion;        % linear velocity 0.1m/s        
    angular_velo_4 = -0.05;                   % angular velocity 0.5 radian/s
    
    [end_point, trajectory] = Trajectory(linear_velo_4, angular_velo_4, init_theta, time_interval, x_start, y_start);
    
end

% mode 5
if (mode_num == 5)
    linear_velo_5 = 0.1 / resultion;        % linear velocity 0.1m/s        
    angular_velo_5 = -0.1;                   % angular velocity 0.5 radian/s
    
    [end_point, trajectory] = Trajectory(linear_velo_5, angular_velo_5, init_theta, time_interval, x_start, y_start);
    
end

end