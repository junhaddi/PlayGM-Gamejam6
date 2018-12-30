var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));
var chr_spd = 4;

scr_chr_mov((key_right - key_left) * chr_spd, (key_down - key_up) * chr_spd);

if (mouse_x > obj_chr.x) {
	image_xscale = 1;
}
else {
	image_xscale = -1;
}

chr_angle = sin(current_time / 500) * 20;

if (chr_hp <= 0) {
	with (system) {
		scr_map_gen();
	}
	show_message("YOU DIED!");
}