%@ brief Generate bitmap for collision check

function bitmap = create_bitmap(width, height)

% initialize bitmap with desried size
bitmap = zeros(width+1, height+1);
for i = 1 : width+1
    for j = 1 : height+1
        
        % assign location to node
        node.coordinate = [i-1 j-1];
        
        if (isInObstacle(node))
            bitmap(i, j) = 1;
        end
    end
end
end



        
        

