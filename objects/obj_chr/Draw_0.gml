draw_sprite_ext(spr_chr, -1, x, y, image_xscale, image_yscale, chr_angle, image_blend, image_alpha);
draw_sprite_ext(spr_chr_wp, -1, x, y, 1, 1, current_time * 50, image_blend, image_alpha);

var target_dir = point_direction(x, y, obj_stair.x, obj_stair.y);
draw_sprite_ext(spr_arrow, -1, x + lengthdir_x(40, target_dir), y + lengthdir_y(40, target_dir), 1, 1, target_dir, c_white, 0.4);

//	HP
for (var i = 0; i < chr_hp; i++) {
	draw_sprite(spr_hp, -1, x + (i * 32) - (chr_hp - chr_hpMax / 2) * 32, y + 32);
}