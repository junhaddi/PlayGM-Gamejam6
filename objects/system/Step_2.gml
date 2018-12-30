//	Cam mov
var _x = camera_get_view_x(cam);
var _y = camera_get_view_y(cam);

_x += (median(0, (obj_chr.x - GAME_WIDTH / 2), room_width - GAME_WIDTH) - _x) * 0.02;
_y += (median(0, (obj_chr.y - GAME_HEIGHT / 2), room_height - GAME_HEIGHT) - _y) * 0.02;

camera_set_view_pos(cam, _x, _y);
camera_set_view_angle(cam, cos(current_time / 1000) * 5);