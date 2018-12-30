if (instance_exists(obj_chr)) {
	var dx = (obj_chr.x div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH / 2;
	var dy = (obj_chr.y div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH / 2;

	if (mp_grid_path(system.enemy_grid, enemy_path, x, y, dx, dy, 1)) {
	    path_start(enemy_path, enemy_spd, path_action_stop, false);
	}
}