%@brief This function check whether an explored node is within the range of bitmap
%@param point_coordinate
%@param bitmap;
%@return within_map true if the point is within the range of bitmap;
%@else return false
function within_map = is_within_bitmap(point_coordinate, bitmap)

x = round(point_coordinate(1));         % assign coordinate x
y = round(point_coordinate(2));         % assign coordinate y

bitmap_length = length(bitmap(:,1));    % row_size of bitmap
bitmap_height = length(bitmap(1,:));    % col_size of bitmap

if (x > 0) && (x < bitmap_length+1) && (y > 0) && (y < bitmap_height+1)
    within_map = true;
else
    within_map = false;
end

end