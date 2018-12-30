//	Die
if (enemy_hp <= 0) {			
	instance_destroy();
}

//	Move
if (distance_to_object(obj_chr) < enemy_move_distance) {
	if (alarm[0] == -1) {
		alarm[0] = enemy_move_delay;
	}
}
else {
	alarm[0] = 0;
	path_end();
}

//	Dir
if (x < obj_chr.x) {
	image_xscale = 1;
}
else {
	image_xscale = -1;
}
