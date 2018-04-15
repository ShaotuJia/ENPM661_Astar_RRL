%@brief This function is to convert node.coordinate (actually coordinate in map) to
%the coordinate in NodeMap
%@param Node; The Node struct
%@param NodeMapCoordinate; The coordinate in NodeMap
function NodeMapCoordinate = Convert_NodeCoord_to_NodeMapCoord(Node)

NodeMapCoordinate = [Node.coordinate(1)+1 Node.coordinate(2)+1];

end