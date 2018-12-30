var xx = argument0;
var yy = argument1;

var xp = x;
var yp = y;

x = xx;
y = yy;

var x_meeting = (system.grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != ROAD) ||
				(system.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != ROAD);
				
var y_meeting = (system.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != ROAD) ||
				(system.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != ROAD);

var center_meeting = system.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != ROAD;

x = xp;
y = yp;

return x_meeting || y_meeting || center_meeting;