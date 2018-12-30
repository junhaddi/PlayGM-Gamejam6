with (obj_chr) {
	if place_meeting(x, y, obj_stair) {
		with (system) {
			scr_map_gen();
			game_score++;
		}
	}
}